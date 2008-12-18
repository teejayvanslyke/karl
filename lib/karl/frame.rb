module Karl

  class Frame < Widget

    def self.from_file(file)
      file  = File.open(file) unless file.is_a?(File)
      frame = Frame.new(file.read.to_proc)
      file.close
      frame
    end

    def title(title=nil)
      @title = title if title
      @title
    end

    def rendered
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
