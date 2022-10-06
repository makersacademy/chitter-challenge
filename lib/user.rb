require 'bcrypt'

class User
  def self.create(email:, password:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    encrypted_password = BCrypt::Password.create(password)
      result = connection.exec("INSERT INTO users (email, password, username) VALUES('#{email}', '#{encrypted_password}', '#{username}') RETURNING id, email, username;")
        User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end

  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.find(id:)
    return nil unless id
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("SELECT * FROM users WHERE id = #{id};")
        User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end

  def self.authenticate(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec_params("SELECT * FROM users WHERE email = $1;", [email])
      return nil if !result.any?
      return unless BCrypt::Password.new(result[0]['password']) == password
        User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end
end