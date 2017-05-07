require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :first_name, String#, :required => true
  property :last_name, String#, :required => true
  property :email, String#, :required => true, :unique => true, :format => :email_address
  property :user_name, String#, :required => true, :unique => true
  property :password_digest, Text#, :required => true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
