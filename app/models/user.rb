require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  attr_reader :name, :user_name, :email, :password

  property :id, Serial
  property :name, String
  property :user_name, String, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
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
