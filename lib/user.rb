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

  def self.authenticate(username:, password:)
    user = find_by(username: username)
    if user
      return user.password == password
    else
      return false
    end
  end
end
