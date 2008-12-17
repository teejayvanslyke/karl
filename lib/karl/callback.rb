module Karl

  class Callback

    def initialize(&block)
      @commands = []
      instance_eval(&block)
    end

    def alert(message)
      add_command(Alert.new(message))
    end

    def add_command(command)
      @commands << command
    end

    def to_js
      result = ""
      @commands.each {|c| result << c.to_js}
      result
    end

  end
  
end
