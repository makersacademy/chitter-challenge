require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id, email)
    @id = id 
    @email = email
  end

  def self.create(email, password)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    encrypted_pw = BCrypt::Password.create(password)

    result = conn.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_pw}') RETURNING id, email;")
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    result = conn.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'])
  end

end
