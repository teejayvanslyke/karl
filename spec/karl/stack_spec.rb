require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Karl::Stack do

  describe "when rendering one child" do

    before :each do 
      @stack = Karl::Stack.new(Proc.new {})
      @child = mock(Karl::Widget, :to_html => 'child')
      @stack.stub!(:children).and_return([@child])
    end

    it "renders a container div around each element" do
      @stack.to_html.should == '<div class="stack"><div class="stack_element">child</div></div>'
    end

  end

  describe "when rendering two children" do

    before :each do 
      @stack = Karl::Stack.new(Proc.new {})
      @child1 = mock(Karl::Widget, :to_html => 'child1')
      @child2 = mock(Karl::Widget, :to_html => 'child2')
      @stack.stub!(:children).and_return([@child1, @child2])
    end

    it "renders a container div around each element" do
      @stack.to_html.should == '<div class="stack"><div class="stack_element">child1</div><div class="stack_element">child2</div></div>'
    end

  end

end
    

