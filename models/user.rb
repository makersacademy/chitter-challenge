class User < ActiveRecord::Base
  validates_presence_of :username, :email, :encrypted_password
end
