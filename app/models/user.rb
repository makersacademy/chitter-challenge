require 'bcrypt'
class User

  include DataMapper::Resource

  has n, :peeps

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password_digest, BCryptHash


  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

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
