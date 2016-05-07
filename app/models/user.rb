require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_format_of :email, :as => /^.+@.+\..+$/
  validates_confirmation_of :password
  property :id,       Serial
  property :username,    String, required: true, unique: true
  property :name,    String, required: true
  property :email,    String, required: true, unique: true
  property :password_digest, Text, required: true
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
