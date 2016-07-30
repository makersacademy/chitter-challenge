require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, String, length: 60

  attr_accessor :confirm_password
  attr_reader :password

  validates_confirmation_of :password, confirm: :confirm_password
  validates_presence_of :email, :username
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email, :username

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
