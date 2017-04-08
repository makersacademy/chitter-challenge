require 'bcrypt'
require 'dm-core'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_reader :password, :email
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id,               Serial
  property :email,            String, format: :email_address, required: true, unique: true
  property :password_digest,  Text

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
