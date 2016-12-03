require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text, required: true
  property :username, String, required: true
  property :name, String, required: true

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email,
    :message => "User already signed-up. Please log in."

  validates_uniqueness_of :username,
    :message => "Username already in use. Please choose another."

  validates_presence_of :password

end
