require 'bcrypt'
# require 'dm-core'
# require 'dm-validations'


class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
<<<<<<< HEAD
  validates_uniqueness_of :email, :username

  has n, :peeps

  property :id, Serial
  property :name, String
  property :username, String, required: true, unique: true
=======

  property :id, Serial
>>>>>>> 030ed49... flash error messages added for incorrect user signup
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

<<<<<<< HEAD
  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
=======

>>>>>>> 030ed49... flash error messages added for incorrect user signup

end
