class User
  include DataMapper::Resource

  property :id,           Serial
  property :user_name,    String
  property :display_name, String
  property :email,        String, format: :email_address
  property :password,     String, format: 10..50
  property :created_at,   DateTime
  property :updated_at,   DateTime

end
