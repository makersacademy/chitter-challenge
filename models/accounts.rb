require 'pg'
require 'bcrypt'

class Accounts

  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.create(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO accounts (username, e_mail, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, e_mail, password;")

     Accounts.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['e_mail'], password: result[0]['password'])
  end

end
