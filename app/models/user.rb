require 'active_record'

class User < ActiveRecord::Base

  def self.check_password(username, password)
    stored_password = User.where(username: username).pluck(:password).first
    true if password == stored_password
  end

end
