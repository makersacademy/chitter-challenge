require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :display_name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, unique: true, required: true
  property :pass_hash, String, length: 60, required: true

  validates_presence_of :password

  has n, :peeps

  def password=(password)
    @password = password
    self.pass_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(username: , password: )
    user = first(username: username)

    return user if user && BCrypt::Password.new(user.pass_hash) == password
    false
  end
end
