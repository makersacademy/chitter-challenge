require 'bcrypt'
# require 'peep'
#
class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :user_name, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  has n, :peeps, through: Resource
  # haven't defined that class yet, leave it in

end
