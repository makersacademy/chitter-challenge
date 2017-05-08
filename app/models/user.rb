require_relative 'post'

require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  attr_reader :password

  property :id, Serial
  property :first_name, String, :required => true
  property :last_name, String, :required => true
  property :email, String, :required => true, :format => :email_address, :unique => true
  property :user_name, String, :required => true, :unique => true
  property :password_digest, Text, :required => true

  has n, :posts



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
