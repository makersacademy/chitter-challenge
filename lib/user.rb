class User
  # class methods

  def self.create(username, email, password, full_name)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password, full_name) 
                                      VALUES('#{username}', '#{email}', 
                                             '#{password}', '#{full_name}') 
                                      RETURNING id, username, email, password, full_name")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], 
             result[0]['password'], result[0]['full_name'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user| 
      User.new(user['id'], user['username'], user['email'], user['password'], user['full_name']) 
    end
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    fail ".find method in User class returns nil" if result.first.nil? #testing purposes only

    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'], 
             result[0]['full_name'])
  end

  def self.exists?(parameter, value)
    result = DatabaseConnection.query("SELECT #{parameter} FROM users") 
    result.map { |row_entry| row_entry[parameter] }.include?(value)
  end

  def self.authenticate(username, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return false unless result.any?
    return false unless result[0]['password'] == password

    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'], 
             result[0]['full_name'])
  end

  # instance methods

  attr_reader :id, :username, :email, :password

  def initialize(id, username, email, password, full_name)
    @id = id
    @username = username
    @email = email
    @password = password
    @full_name = full_name
  end

  def full_name
    @full_name.split.map { |name| name.capitalize }.join(" ")
  end
end
