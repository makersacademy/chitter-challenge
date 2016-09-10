require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"
require "dm-validations"

class User

  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :email,            String
  property :username,         String
  property :password_digest,  Text

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
