
class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true
  property :email, String, required: true, unique: true
  property :name, String
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  attr_reader :password
  attr_accessor :password_confirmation

end
