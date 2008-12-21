module Karl

  class TextField < Widget

    def initialize(value="")
      @value = value
    end

    def to_html
      '<input type="text" id="'+dom_id+'" class="'+html_class+'" value="'+@value+'"/>'
    end

  end

end
