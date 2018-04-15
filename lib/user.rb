require 'pg'
require 'bcrypt'
require_relative './database.rb'

class User

  def self.add(username, name, email, password)
    encrypted_password = BCrypt::Password.create(password)
    Database.exec("INSERT INTO users(username, name, email, password)
    VALUES('#{username}', '#{name}', '#{email}', '#{encrypted_password}')
    RETURNING id, username, name;")
  end

  def self.authenticate(username, password)
    result = Database.exec("SELECT * FROM users WHERE username = '#{username}'")

    if result.any?
      if BCrypt::Password.new(result[0]['password']) == password
        return result
      end
    else
      return nil
    end

  end


end
