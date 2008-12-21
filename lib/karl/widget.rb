require 'activesupport'

module Karl

  class Widget

    def to_js 
      @children.map{|c| c.to_js }.join("\n")
    end

    def to_html
      @children.map{|c| c.to_html }.join("\n")
    end

    def self.html_class
      self.name.split('::').last.underscore
    end

    def html_class
      self.class.html_class
    end

    def initialize(block)
      @children = []
      instance_eval(&block)
    end

    def stack(&block)
      add_child Stack.new(block)
    end

    def flow(&block)
      add_child Flow.new(block)
    end

    def button(title=nil)
      add_child(Button.new(title))
    end

    def text_field(value=nil)
      add_child(TextField.new(value))
    end

    def add_child(child)
      @children << child
      return child
    end

    def dom_id
      "karl_#{object_id}"
    end


  end

end

