module Karl

  class Stack < Widget

    def to_html
      result = '<div class="' << html_class << '">'
      children.each do |child|
        result << '<div class="' << html_class << '_element">' << child.to_html << '</div>'
      end
      result += '</div>'
    end

  end

end
