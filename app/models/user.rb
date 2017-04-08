# # This class will be responsible for the user.
# require 'bcrypt'
#
# class User
#   include DataMapper::Resource
#   attr_reader :password
#   attr_accessor :password_confirmation
#
#   property :id,       Serial
#   property :email,    String
#   property :username, String
#
#   property :password_digest, Text
#   validates_confirmation_of :password_digest
#
#   def password=(password)
#     @password = password
#     self.password_digest = BCrypt::Password.create(password)
#   end
# end
