require 'data_mapper'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation



  property :id,             Serial
  property :email,          String, required: true, unique: true
  property :password_digest,Text
  property :name,           String, required: true
  property :username,       String, required: true, unique: true


  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_presence_of :name
  validates_presence_of :username

  has n, :posts

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user=first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
