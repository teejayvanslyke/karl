module Karl

  class Button < Widget

    def initialize(title="Untitled Button")
      @title = title
    end

    def to_html
      '<input type="button" id="'+dom_id+'" class="'+html_class+'" value="'+@title+'"/>'
    end

  end

end
