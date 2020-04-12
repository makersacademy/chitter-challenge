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

  def self.log_in(email:, password:)
    user = User.find_by(email: email)
    auth = user.authenticate(password)
    auth.id
  end
end
