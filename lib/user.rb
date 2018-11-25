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
    hash = BCrypt::Password.create(user_info['password'])
    result = DatabaseConnection.query("INSERT INTO users(first_name,last_name,email,password_hash,salt) 
    VALUES ('#{user_info['first_name']}', '#{user_info['last_name']}', '#{user_info['email']}', 
    '#{hash}','#{hash}') RETURNING id, email;")

    User.new(id: result[0]['id'], email: result[0]['email'])    
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    result.map { |user|
      User.new(id: result[0]['id'], email: result[0]['email'])
    } 
  end

  def self.login(email, password)
    return nil if email.empty? || password.empty?
    
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    if BCrypt::Password.new(result[0]['password_hash']) == password
      user = User.new(id: result[0]['id'], email: result[0]['email'])
    end
  end

end
