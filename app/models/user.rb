require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :full_name, String
  property :user_name, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :peeps

  validates_confirmation_of :password
  validates_uniqueness_of :user_name
  validates_uniqueness_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
