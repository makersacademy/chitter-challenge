class User

  require 'bcrypt'
  include DataMapper::Resource
  attr_reader :password

  property :id, Serial
  property :username, String, required: true
  property :name, String, required: true
  property :email, String, required: true, :format => :email_address
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_uniqueness_of :email, :username
end
