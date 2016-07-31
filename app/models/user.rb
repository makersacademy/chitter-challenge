require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, :required => true, unique: true

  property :password_digest, String, length: 60

  validates_presence_of :password
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
