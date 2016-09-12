require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative '../data_mapper_setup'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id,                Serial
  property :username,          String,   :required => true
  property :email,             String,   :required => true
  property :password_digest,   Text,     :required => true

  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email, :username
  validates_confirmation_of :password

  attr_reader :password
  attr_accessor :password_confirmation

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
