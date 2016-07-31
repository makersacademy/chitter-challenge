require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_writer :password_confirm

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :encrypted_password, String, length: 60
  property :email, String, :unique => true

  validates_presence_of :encrypted_password, :confirm => :password_confirm

  def password=(password)
    self.encrypted_password = BCrypt::Password.create(password)
  end

  def self.authenticate(username:, password:)
    user = first(username: username)
    if user && BCrypt::Password.new(user.encrypted_password) == password
      return user
    end
  end

  has n, :peeps

  private
  attr_reader :password_confirm

end
