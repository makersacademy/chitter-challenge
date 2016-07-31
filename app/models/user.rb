require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  #validates_format_of :email, as: :email_address

  property :id,                                    Serial
  property :name,                                  String
  property :email,                                 String
  property :password_digest,                       String, length: 20

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
