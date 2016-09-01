require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peeps, through: Resource

  property :id, Serial
  property :full_name, String, required: true

  property :username, String

  validates_uniqueness_of :username
  validates_presence_of :username

  property :email, String, format: :email_address


  validates_uniqueness_of :email
  validates_presence_of :email

  property :password_digest, String, length: 60

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
