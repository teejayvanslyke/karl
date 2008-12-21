require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Karl::Widget do

  describe "when retrieving the html-ready class name of the widget" do
    module Karl
      class SteveDave < Widget
      end
    end

    it "returns the underscored version of the class's basename" do
      Karl::SteveDave.html_class.should == "steve_dave"
    end
  end

end

