require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :name,            String
  property :email,           String
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
      nil
    end
  end

  validates_presence_of     :email
  validates_format_of       :email, as: :email_address
  validates_uniqueness_of   :email

  validates_confirmation_of :password
end
