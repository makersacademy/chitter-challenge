class Email
  attr_reader :user

  def initialize(user)
    @to_email = user.email
    @to_name = user.email.split(/@/).first
  end
end

class WelcomeEmail < Email
  attr_reader :to_email, :to_name, :subject, :body

  def initialize(user)
    super(user)
    @subject = 'Welcome to Chitter!'
    @body = "<h3>You are now signed up to Chitter, #{to_name}!</h3>"
  end
end
