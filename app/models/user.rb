class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, Text
  property :email, Text
  property :password, Text
  property :created_at, DateTime
  property :created_on, Date

  has n, :peeps
end
