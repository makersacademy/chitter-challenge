require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :peeps
  validates_presence_of :username, :forename, :surname, :email, :password
  validates_uniqueness_of :username, :email

  def self.check_password(username, password)
    stored_password = User.where(username: username).pluck(:password).first
    return false if stored_password.nil? || BCrypt::Password.new(stored_password) != password
    true
  end

  def self.assign_user(username)
    @@logged_in_name = username
  end

  def self.logged_in_name
    @@logged_in_name
  end

end
