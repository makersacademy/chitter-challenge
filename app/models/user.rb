require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include  DataMapper::Resource

  has n, :peeps, through: Resource

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  property :id, Serial
  property :full_name, String
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text
  validates_confirmation_of :password
  validates_length_of :password, min: 8

  validates_presence_of :email
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
