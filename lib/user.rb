require 'pg'
require 'sinatra/activerecord'
require 'bcrypt'

# disable logging
# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

class User < ActiveRecord::Base
  
  has_secure_password

  def handle
    "@#{self.user_name}"
  end

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    return nil if user.nil?

    auth = user.authenticate(password)
    return nil unless auth

    auth.id
  end
end
