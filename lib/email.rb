class Email
  attr_reader :user
  
  def initialize(user)
    @user = user
  end
end

class WelcomeEmail < Email
  attr_reader :user, :subject, :body

  def initialize(user)
    super(user)
    @subject = 'Welcome to Chitter!'
    @body = "<h3>You are now signed up to Chitter, #{@user.email}!</h3>"
  end
end
