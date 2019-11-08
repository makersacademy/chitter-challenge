


class Peep

    attr_reader :time, :title, :body

    def initialize(title, body)
      @time = Time.now
      @title = title
      @body = body
    end

end
