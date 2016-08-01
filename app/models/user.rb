class User

  include DataMapper::Resource

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  property :id,       Serial
  property :username, String
  property :name,     String
  property :email,    String, required: true
  # property :password, String

end
