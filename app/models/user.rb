require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :user_name, String, unique: true, required: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password, String, required: true


end