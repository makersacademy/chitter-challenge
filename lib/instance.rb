require 'pg'
require 'uri'
require_relative 'database_connection.rb'
require_relative 'validate.rb'
require 'argon2'
require_relative 'user.rb'
require_relative 'email_sender.rb'

class Instance

  @@current_users = []

  def self.current_users
    @@current_users
  end
  
  def self.login(email, password_attempt)
    return false if User.find(email) == nil
    user = User.find(email)
    secure_password = user.password_hash
    verify(password_attempt, secure_password) ? @@current_users.push(user) : false
  end

  def self.logout(email)
    user = User.find(email)
    @@current_users.delete(user)
  end

  def self.email(text)
    User.all.each do |user|
      if text.include? user.email
        Emailsender.send(user.email)
      end
    end
  end

  private
  def self.verify(attempt, secure_password)
    Argon2::Password.verify_password(attempt, secure_password)
  end
end
