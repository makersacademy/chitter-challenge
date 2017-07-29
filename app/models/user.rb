class User

  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :username,     String, required: true, unique: true
  property :email,        String, required: true, unique: true

  validates_format_of :email, :as => :email_address

end
