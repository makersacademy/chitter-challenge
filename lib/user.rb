require 'pg'

class User

  attr_reader :first_name, :last_name, :email, :username, :password

  def initialize(first_name, last_name, email, username, password)
    @first_name = first_name
    @last_name = last_name
    @email  = email
    @username = username
    @password = password
  end

  def create(first_name:, last_name:, email:, username:, password:)
    ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
    connection = PG.connect(dbname: db)
    connection.exec "INSERT INTO users (first_name, last_name, email, username, password)
    VALUES('#{first_name}', '#{last_name}', '#{email}', '#{username}', '#{password})"
  end

  def authenticate(email:, password:)
    ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
    connection = PG.connect(dbname: db)
    result = connection.query("SELECT * FROM users")
    result.each do |user|
    return true if user['email'] == email && user['password'] == password
  end

end
