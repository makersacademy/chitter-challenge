class Message

  def initialize(id:, message:, create_date:, username: , replies: [])
    @id = id
    @message = message
    @create_date = create_date
    @username = username
    @replies = replies
  end

  attr_reader :id, :message, :create_date, :username, :replies
end