require 'bcrypt'
# require 'peep'
#
class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  attr_accessor :name
  #validates_confirmation_of is a datamapper method. it stops the model from saving unless password matches.
  validates_confirmation_of :password

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :name, String
  property :user_name, String

  def password=(password)
    @password = password
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
