require 'data_mapper'
require 'dm-core'
require 'dm-validations'
require 'bcrypt'
require 'rubygems'
class User
include DataMapper::Resource
has n, :posts, through: Resource

property :id, Serial
property :first_name, String, :required => true
property :last_name, String, :required => true
property :user_name, String, :unique => true, :required => true
property :email, String, :unique => true, :required => true
property :password_encripted, Text, :required => true


def password=(password)
  self.password_encripted= BCrypt::Password.create(password)
end

def self.authenticate(user_name, password)
  user = first(user_name: user_name)

if user && BCrypt::Password.new(user.password_encripted) == password
  user
else
  nil
end
end

end
