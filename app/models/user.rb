require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation

  validates_confirmation_of :password, :confirm => :password_confirmation, :message => 'Password and confirmation password do not match'

  def self.authenticate(email, password)
    user = first(email:email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  property :id, Serial
  property :email, String, :required => true, :format => :email_address, :unique => true,
    :messages => {
      :presence => 'Please enter an email address',
      :format => 'Please enter a valid email address',
      :is_unique => 'This user already exists'
    }
  property :password_hash, String, :length => 128

end
