require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :peeps
  validates_presence_of :username, :forename, :surname, :email, :password
  validates_uniqueness_of :username, :email

  def self.assign_user(username)
    @@logged_in_name = username
  end

  def self.logged_in_name
    @@logged_in_name
  end

end
