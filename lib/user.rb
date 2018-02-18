class User

  attr_reader :full_name, :username, :email, :password

  def initialize(full_name, username, email, password)
    @full_name = full_name
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map { |user| User.new(user['username']) }
  end


end
