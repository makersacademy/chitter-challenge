class User 
  def self.create(first_name, last_name, username, email, password)
    current_user = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, username, email, password)
       VALUES('#{first_name}', '#{last_name}', '#{username}', '#{email}', '#{password}')
       RETURNING *"
      )
    User.get_current(current_user.first['id'])
  end

  def self.get_current(id) 
    rs = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    result = rs.first
    User.new(result['first_name'], result['last_name'], result['username'], result['email'], result['id'])
  end

  def self.logout
    nil
  end

  def self.login(email, password)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}'"
    )
    User.get_current(result.first['id'])
  end

  attr_reader :first_name, :last_name, :username, :email, :id

  def initialize(first_name, last_name, username, email, id)
    @first_name = first_name
    @last_name = last_name
    @username = username
    @email = email
    @id = id
  end

  def self.current
    @current
  end
  
end
