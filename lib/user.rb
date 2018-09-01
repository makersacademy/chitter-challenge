class User

  attr_reader :name, :username, :email, :password

  def self.create(name, username, email, password)
    @user = User.new(name, username, email, password)
  end

  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.instance
    @user
  end

end
