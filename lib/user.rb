require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticated?(username:, password:)
    user = find_by(username: username)
    
    return false unless user
    return user.password == password
  end
end
