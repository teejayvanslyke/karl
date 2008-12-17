module Karl

  class Alert

    def initialize(message)
      @message = message
    end

    def to_js
      "alert('#{@message}');"
    end

  end

end
