
require 'bcrypt'

class User

include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :user_name, String, unique: true

  has n, :peeps, through: Resource

  #belongs_to :peep

  def self.authenticate(user_name, password)
  user = first(user_name: user_name)

  if user && BCrypt::Password.new(user.password_digest) == password
    user
  else
      nil
  end
end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
