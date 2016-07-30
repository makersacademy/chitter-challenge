require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String, :required => true, unique: true

  property :password_digest, String, length: 60


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
