require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true    # required for all
  property :username, String, required: true
  property :email, String, required: true, unique: true     # unique 
  property :password_digest, Text

  has n, :peeps, through: Resource

  def password= password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate email, password
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  validates_confirmation_of :password
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
end