require 'active_record'

class User < ActiveRecord::Base

  def self.check_password(username, password)
    stored_password = User.where(username: username).pluck(:password).first
    true if password == stored_password
  end

  def self.logged_in_user(username)
    @@logged_in_name = username
  end

  def self.logged_in_name
    @@logged_in_name
  end

end
