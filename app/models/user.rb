require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :handle, String, length: 15, required: true, unique: true

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(handle, password)
    user = first(handle: handle)
    return unless user
    BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :handle
  validates_uniqueness_of :email
  validates_uniqueness_of :handle

end
