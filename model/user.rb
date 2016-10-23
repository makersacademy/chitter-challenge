require 'bcrypt'
require 'dm-validations'
class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, :required => true
  property :user_name, String, :required => true, :unique => true
  property :email, String, :format => :email_address, :required => true, :unique => true
  property :password_digest, Text, :required => true, :lazy => false

  has n, :peeps

  validates_confirmation_of :password



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(:user_name => user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
