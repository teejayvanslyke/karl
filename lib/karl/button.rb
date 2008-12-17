module Karl

  class Button < Widget

    def initialize(title="Untitled Button")
      @title = title
      @callbacks = {}
    end

    def to_html
      '<input type="button" id="'+dom_id+'" value="'+@title+'"/>'
    end

    def click(&block)
      @callbacks[:click] ||= []
      @callbacks[:click] << Callback.new(&block)
    end

    def hover(&block)
      @callbacks[:hover] ||= []
      @callbacks[:hover] << Callback.new(&block)
    end

    def dom_id
      "karl_#{object_id}"
    end

    def to_js
      result = ""
      @callbacks.each do |event, callbacks|
        result << "$(function() { $('##{dom_id}').#{event}(function(e) {"
        callbacks.each {|c| result << c.to_js}
        result << "});});"
      end
      result
    end

  end

end
