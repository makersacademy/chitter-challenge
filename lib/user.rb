class User
  attr_reader :username, :password, :email_address

  def initialize(name: , pw: , email: )
    @username = name
    @password = pw
    email_address = email
  end
end