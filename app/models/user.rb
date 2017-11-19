class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, Text
  property :password, Text

  has n, :peeps
end
