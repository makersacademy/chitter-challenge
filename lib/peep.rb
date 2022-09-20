class Peep
    attr_accessor :username, :content, :time
  
    def initialize(username, content)
      @username = username
      @content = content
      @time = Time.now
    end
  end