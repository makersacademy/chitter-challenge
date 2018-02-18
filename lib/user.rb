class User

  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{options[:email]}', '#{options[:password]}') RETURNING id, email, password;") # returns PG::result
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end


end
