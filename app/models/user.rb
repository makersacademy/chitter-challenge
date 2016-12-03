class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :password_digest, Text

  validates_presence_of :email
  validates_format_of :email, as: :email_address


end
