module Karl

  class Frame < Widget

    def self.from_file(file)
      file  = File.open(file) unless file.is_a?(File)
      frame = Frame.new(file.read)
    end

    def initialize(block)
      @children = []
      eval(block)
    end

    def title(title=nil)
      @title = title if title
    end

    def javascript
      @children.map{|c| c.to_js }.join("\n")
    end

    def button(title=nil)
      add_child(Button.new(title))
    end

    def add_child(child)
      @children << child
      return child
    end

    def body
      @children.map{|c| c.to_html }.join("\n")
    end

    def to_html
      File.open(File.dirname(__FILE__) + '/frame.erb') do |f|
        erb = ERB.new(f.read)
        erb.result(self.get_binding)
      end
    end

    def get_binding
      binding
    end

  end

end
