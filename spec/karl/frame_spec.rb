require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Karl::Frame do

  before :each do
    @frame = Karl::Frame.new(Proc.new{})
  end

  it "has a title" do
    @frame.title "terrance"
    @frame.title.should == "terrance"
  end

  describe "when rendering the frame" do

    before :each do
      File.stub!(:dirname).and_return('dirname')
      @file_path = 'dirname/frame.erb'
      @erb       = mock(ERB)
      @result    = "THE RESULT"

      @binding   = mock(:binding)
      @frame.stub!(:get_binding).and_return(@binding)
      File.stub!(:open).with(@file_path).and_yield(@file)
      @file.stub!(:read).and_return('contents')
      ERB.stub!(:new).with('contents').and_return(@erb)
      @erb.stub!(:result).with(@binding).and_return(@result)
    end

    it "opens the file containing the ERB markup" do
      File.should_receive(:open).with(@file_path).and_yield(@file)

      @frame.rendered
    end

    it "reads it" do
      @file.should_receive(:read).and_return('contents')

      @frame.rendered
    end

    it "processes it through ERB" do
      ERB.should_receive(:new).with('contents').and_return(@erb)

      @frame.rendered
    end

    it "gets the result" do
      @erb.should_receive(:result).with(@binding).and_return(@result)
      
      @frame.rendered
    end

    it "returns the result" do
      @frame.rendered.should == @result

      @frame.rendered
    end

  end
  

  describe "when creating a new frame from a file" do

    describe "when it's a file" do
    end

    describe "when it's a file name" do
    end

    it "opens the file"

  end

end
