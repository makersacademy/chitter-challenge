class Email
  def initialize(user)
    @address = user.email
    @name = user.email.split(/@/).first
  end
end

class WelcomeEmail < Email
  attr_reader :address, :name, :subject, :body

  def initialize(user)
    super(user)
    @subject = "Welcome to Chitter!"
    @body = "<h3>You are now signed up to Chitter, #{name}!</h3>"
  end
end

class TaggedEmail < Email
  attr_reader :address, :name, :subject, :body

  def initialize(user, peep)
    super(user)
    @subject = 'You\'ve been tagged'
    @body = "<h3>#{name}, you were tagged in the following peep:</h3><p>#{peep.content}</p>"
  end
end
