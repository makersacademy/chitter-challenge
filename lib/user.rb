require './lib/database_connection'
require 'pg'
require 'bcrypt'

class User
  attr_accessor :id, :email

  def initialize(id:,email:)
    @id = id
    @email = email
  end

  def self.create(user_info)
    DatabaseConnection.setup('chitter')
    db = DatabaseConnection.connection

    hash = BCrypt::Password.create(user_info['password'])
    # print db
    result = db.exec("INSERT INTO users(first_name,last_name,email,password_hash,salt) 
    VALUES ('#{user_info['first_name']}', '#{user_info['last_name']}', '#{user_info['email']}', 
    '#{hash}','#{hash}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])    
  end

end
