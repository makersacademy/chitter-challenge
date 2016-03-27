require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :username, String, :lazy => false
  property :email, Text, :lazy => false, :required => true, :format => :email_address, :unique => true
  property :password_digest, Text, :lazy => false

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # def self.authenticate(email, password)
  #   user = first(email: email)
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     user
  #   else
  #     nil
  #   end
  # end


end
