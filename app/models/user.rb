class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :password_digest, Text, :required => true

  attr_accessor :password_digest_confirmation



  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password_digest


end
