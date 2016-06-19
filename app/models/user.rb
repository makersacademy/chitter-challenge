require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  
  has n, :cheeps

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60
  property :name, String
  property :user_name, String, required: true, unique: true

  validates_presence_of :email
  validates_presence_of :password
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
