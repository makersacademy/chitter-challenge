require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :username, String
  property :password_digest, String, :length => 255
  property :id,       Serial
  property :name,     Text
  property :email,    Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_presence_of :name, :email, :username
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email, :username
  validates_confirmation_of :password


end
