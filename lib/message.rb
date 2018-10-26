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
    @user_handle = user_handle
    connection = PG.connect(dbname: 'chitterdb')
    export = connection.exec("SELECT user_name FROM users WHERE user_handle = '#{@user_handle}';")
    obj = export.map{|result| result}
    objhash = obj[0]
    @user_name = objhash["user_name"]
  end

  def text(text)
    @text = text
  end

  def self.instance
    @message
  end

end
