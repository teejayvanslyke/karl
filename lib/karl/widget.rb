require 'activesupport'

module Karl

  class Widget

    def to_js 
      @children.map{|c| c.to_js }.join("\n")
    end

    def to_html
      @children.map{|c| c.to_html }.join("\n")
    end

    def html_class
      self.class.name.underscore.gsub('/', '_')
    end

    def initialize(block)
      @children = []
      instance_eval(&block)
    end

    def stack(&block)
      add_child Stack.new(block)
    end

    def button(title=nil)
      add_child(Button.new(title))
    end

    def add_child(child)
      @children << child
      return child
    end

  end

end

