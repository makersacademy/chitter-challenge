require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  attr_accessor :password_confirmation

  validates_confirmation_of :password, :confirm => :password_confirmation, :message => 'Password and confirmation password do not match'

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  property :id, Serial
  property :email, String, :required => true, :format => :email_address, :unique => true
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  property :password_hash, String, length: 128

end
