class Message

  def initialize(id:, message:, create_date:, username: )
    @id = id
    @message = message
    @create_date = create_date
    @username = username
  end

  attr_reader :id, :message, :create_date, :username
end