require 'activesupport'

module Karl

  class Widget

    attr_reader :children

    def to_html
      @children.map{|c| c.to_html }.join("\n")
    end

    def to_js
      @callbacks.inject("") do |acc, callback|
        event = callback[0]
        javascript = callback[1]
        acc << "$(##{dom_id}).#{event}(function(event){#{javascript}});"
      end << @children.map{|c| c.to_js }.join("\n") 
    end

    def self.html_class
      self.name.split('::').last.underscore
    end

    def html_class
      self.class.html_class
    end

    def initialize(block)
      @children  = []
      @callbacks = []
      instance_eval(&block)
    end

    def stack(&block)
      add_child Stack.new(block)
    end

    def flow(&block)
      add_child Flow.new(block)
    end

    def button(title=nil)
      add_child(Button.create(title))
    end

    def text_field(value=nil)
      add_child(TextField.new(value))
    end

    def click(javascript)
      add_callback(:click, javascript)
    end

    def add_callback(event, javascript)
      @callbacks ||= []
      @callbacks << [event, javascript]
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

