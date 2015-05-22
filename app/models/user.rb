require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation, :user_handle

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, message: 'This email is already taken'
  property :handle, String, unique: true,
            message: 'This user name is already taken'
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_uniqueness_of :email, :handle
  validates_confirmation_of :password,
                            message: 'Password does not match the confirmation'

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      return user
    else
      nil
    end
  end

end
