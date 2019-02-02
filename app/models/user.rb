require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base

  def self.check_password(username, password)
    stored_password = User.where(username: username).pluck(:password).first
    return if stored_password.nil?
    true if BCrypt::Password.new(stored_password) == password
  end

  def self.set_user(username)
    @@logged_in_name = username
  end

  def self.logged_in_name
    @@logged_in_name
  end

end
