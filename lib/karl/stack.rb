module Karl

  class Stack < Widget

    def to_html
      '<div class="' << html_class << '">' <<
      super                 <<
      '</div>'
    end

  end

end
