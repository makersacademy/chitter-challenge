class Message

    attr_reader :body, :author, :date
  
  def initialize(author, body, date)
    @author = author
    @body = body
    @date = date
  end
    
end