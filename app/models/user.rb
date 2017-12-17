require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"
require "dm-validations"

class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  property :id,                    Serial
  property :name,                  String
  property :username,              String
  property :email,                 String, required: true
  property :password_digest,       Text

  has n, :peeps

  validates_confirmation_of :password
  validates_format_of       :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
