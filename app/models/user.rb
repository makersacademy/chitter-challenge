require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email, :username

  has n, :peeps, through: Resource

  property :id,   Serial
  property :first_name, String
  property :last_name, String
  property :username, String, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      non-identical
    end
  end

end
