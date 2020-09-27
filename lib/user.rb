class User 

  attr_reader :username, :email, :password, :user

  def initialize(username, email, password)
    @username = username
    @email = email
    @password = password
  end

  def self.current_user
    @user
  end

  def self.create(username, email, password)
    @user = User.new(username, email, password)
  end

end
