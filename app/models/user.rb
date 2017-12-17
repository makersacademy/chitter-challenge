require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_reader :email
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  has n, :peep

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
