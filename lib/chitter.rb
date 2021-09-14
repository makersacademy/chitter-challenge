class ChitterMessage

    attr_reader :options

    def initialize(username,message)
        @username = username
        @message = message
    end

    def create_peep
        @message = message
    end

    def generate_timestamp
        time = Time.new
        @timestamp = time.strftime("%d/%m/%Y %k:%M")
    end

  end 