require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :handle, String, required: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  validates_presence_of :email
  validates_presence_of :handle
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :handle



  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(handle, password)
    user = first(handle: handle)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
