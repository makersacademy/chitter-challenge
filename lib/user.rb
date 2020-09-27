class User 

  attr_reader :username, :name, :email, :password, :user

  def initialize(username, name, email, password)
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.current_user
    @user
  end

  def self.create(username, name, email, password)
    @user = User.new(username, name, email, password)
  end

end
