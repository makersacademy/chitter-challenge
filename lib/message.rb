class Message
  attr_reader :text, :user_handle, :user_name

  def initialize(text, handle, name)
    @date = Date.new
    @time = Time.new
    @text = text
    @user_handle = handle 
    @user_name = name
  end

  def date(date = @date)
    @date = date
  end

  def time(time = @time)
    @time = time
  end

  def user_handle(handle = @user_handle)
    @user_handle = handle
  end

  def user_name(name = @user_name)
    @user_name = name
  end

  def text(text = @text)
    @text = text
  end

  def self.create(text, handle, name)
    @message = Message.new(text, handle, name)
  end

  def self.instance
    @message
  end

end
