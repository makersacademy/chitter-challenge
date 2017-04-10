require 'bcrypt'

class User

  include DataMapper::Resource
  # has n, :peeps, through: Resource

  property :id, Serial
  property :name, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :user_name, String, required: true, unique: true
  property :password_digest, Text
  attr_reader :password
  attr_accessor :confirm_password

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

  # default would be password_confirmation, unless changed like below
  validates_confirmation_of :password, confirm: :confirm_password

end
