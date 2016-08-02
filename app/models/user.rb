require 'bcrypt'

class User
  attr_accessor :password_confirmation
  attr_reader :password

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :user, String, required: true
  property :username, String, required: true
  property :password_digest, String, length: 60

  has n, :peeps

  validates_confirmation_of :password
  validates_uniqueness_of :email, :username

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
