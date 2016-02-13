require 'bcrypt'

class User
include DataMapper::Resource

property :id, Serial
property :user_name, String
property :email, String, required: true, unique: true
property :password_digest, Text


end
