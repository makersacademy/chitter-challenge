require 'bcrypt'

class User

  attr_reader :email, :password, :name, :username
  attr_accessor :password_confirmation

  include DataMapper::Resource 

  has n, :peeps, through: Resource

  property :id, Serial 
  property :name, String
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
  validates_confirmation_of :password 
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
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