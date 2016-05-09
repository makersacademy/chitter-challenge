require 'bcrypt'
require 'dm-validations'

class User
  include BCrypt
  include DataMapper::Resource

  has n, :peeps

  property :id,       Serial, required: true
  property :name,     String, required: true
  property :email,    String, format: :email_address, required: true, unique: true
  property :password_digest, BCryptHash



  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :confirm => :password_confirmation

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end


end
