require 'sinatra/activerecord'
require 'bcrypt'

# disable logging
ActiveRecord::Base.logger = nil

class User < ActiveRecord::Base
  
  has_secure_password

  validates :email, :user_name, uniqueness: true

  def handle
    "@#{self.user_name}"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    return nil if user.nil?

    auth = user.authenticate(password)
    return nil unless auth

    auth.id
  end
end
