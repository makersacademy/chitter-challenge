# require 'bcrypt'
require_relative 'peep'
# understands how to create a User table
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :email, Text
  property :password, Text
  # property :password_digest, Text
  #
  # attr_reader :password
  # attr_accessor :password_confirmation
  #
  # validates_confirmation_of :password
  #
  # def password=(password)
  #   @password = password
  #   self.password_digest = BCrypt::Password.create(password)
  # end

end
