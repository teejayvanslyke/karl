require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Karl::Flow do

  describe "when rendering one child" do

    before :each do 
      @flow  = Karl::Flow.new(Proc.new {})
      @child = mock(Karl::Widget, :to_html => 'child')
      @flow.stub!(:children).and_return([@child])
    end

    it "renders a container div around each element" do
      @flow.to_html.should == '<div class="flow"><div class="flow_element">child</div></div>'
    end

  end

  describe "when rendering two children" do

    before :each do 
      @flow = Karl::Flow.new(Proc.new {})
      @child1 = mock(Karl::Widget, :to_html => 'child1')
      @child2 = mock(Karl::Widget, :to_html => 'child2')
      @flow.stub!(:children).and_return([@child1, @child2])
    end

    it "renders a container div around each element" do
      @flow.to_html.should == '<div class="flow"><div class="flow_element">child1</div><div class="flow_element">child2</div></div>'
    end

  end

end
    

