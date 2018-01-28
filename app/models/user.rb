
class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String, :unique_index => true
  property :email, Text, :unique_index => true
  property :password, Text

  validates_uniqueness_of :email, :username
end

#:index=>true
