require 'bcrypt'
class Maker

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :messafe => "Sorry, your passwords don't match"
  validates_uniqueness_of :username


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end