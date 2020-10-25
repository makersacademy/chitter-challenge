require 'pg'
require 'bcrypt'

class Users
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end


  def self.sign_up(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, email")
    Users.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end
# wrap the data base into the code.
# look back at bookamrks and check
# check peeps class 
# make sure the page is working before commit.