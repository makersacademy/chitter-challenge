class Message
  attr_reader :user_handle

  def date
    @date = Date.new
  end

  def time
    @time = Time.new
  end

  def user_handle(user)
    @user_handle = user.handle
  end

  def user_name(user_handle = @user_handle)

  end

  def text(text)
    @text = text
  end

  def self.instance
    @message
  end

end
