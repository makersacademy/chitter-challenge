class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :user_name, String
  property :email_address, String
  property :password, String

  has n, :peeps
end
