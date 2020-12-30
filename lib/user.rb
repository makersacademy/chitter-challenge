require 'active_record'
require 'bcrypt'
require_relative './peep.rb'

class User < ActiveRecord::Base

  has_secure_password

  def self.check_duplicate(user)
    if User.find_by(email: user[:email])
      'That email address is already registered.'
    elsif User.find_by(username: user[:username])
      'That username is already taken!'
    end
  end

end
