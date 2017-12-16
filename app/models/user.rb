require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email_address, String
  property :password_digest, Text

  attr_accessor :password_confirmation
  attr_reader :password
  attr_reader :email_address

  validates_confirmation_of :password
  validates_presence_of :email_address
  validates_format_of :email_address, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
