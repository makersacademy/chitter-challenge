require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property(:id, Serial)
  property(:real_name, String)
  property(:username, String)
  property(:email_address, String, required: true)
  property(:password_digest, Text)

  validates_format_of :email_address, as: :email_address

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email_address, password)
    user = first(email_address: email_address)

    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    end
  end
end
