class User
  attr_reader :id, :email, :name, :username

  def initialize(id, email, name, username)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email, password, name, username, connection = connect_to_database)
    connection.exec "INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')"
  end

  def self.exists?(username, connection = connect_to_database)
    user = connection.exec "SELECT * FROM users WHERE username = '#{username}'"
    user.ntuples > 0
  end

  def self.correct_password?(username, password, connection = connect_to_database)
    user = connection.exec "SELECT * FROM users WHERE username = '#{username}'"
    user[0]['password'] == password
  end

  def self.select_by_id(id, connection = connect_to_database)
    result = connection.exec "SELECT id, email, name, username FROM users WHERE id = '#{id}'"
    User.new(result[0]['id'], result[0]['email'], result[0]['name'], result[0]['username'])
  end

  def self.select_by_username(username, connection = connect_to_database)
    result = connection.exec "SELECT id, email, name, username FROM users WHERE username = '#{username}'"
    User.new(result[0]['id'], result[0]['email'], result[0]['name'], result[0]['username'])
  end

  private_class_method

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'chitter_test'
    else
      PG.connect dbname: 'chitter'
    end
  end
end
