require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peep

  property :id,               Serial
  property :name,             String
  property :email,            String, required: true, unique: true
  property :username,         String, required: true, unique: true
  property :password_digest,  Text,   required: true

  validates_confirmation_of   :password
  validates_format_of         :email, as: :email_address

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
