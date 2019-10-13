class Messages
  attr_reader :text, :time, :user_id, :user

  def initialize(id:, text:, time:, user_id:, user:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
    @user = user
  end

  def self.create(id, message_text, message_time, user_id, user)
    @message = Messages.new(
      id: id,
      text: message_text,
      time: message_time,
      user_id: user_id,
      user: user)
  end

  def self.instance
    @message
  end
end
