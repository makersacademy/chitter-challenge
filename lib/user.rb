require 'active_record'
require_relative './peep.rb'

class User < ActiveRecord::Base

  def self.check_duplicate(user)
    if User.find_by(email: user[:email])
      notice = 'That email address is already registered.'
    elsif User.find_by(username: user[:username])
      notice = 'That username is already taken!'
    end
    notice
  end

end
