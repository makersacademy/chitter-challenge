class User
  attr_reader :email, :name, :username

  def initialize(email, name, username)
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

  def self.select(username, connection = connect_to_database)
    result = connection.exec "SELECT email, name, username FROM users WHERE username = '#{username}'"
    result.map do |row|
      User.new(row['email'], row['name'], row['username'])
    end
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'chitter_test'
    else
      PG.connect dbname: 'chitter'
    end
  end
end
