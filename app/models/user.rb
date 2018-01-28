
class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String
  property :email, Text, :unique_index => true
  property :password, Text

  validates_uniqueness_of :email
end

#:index=>true
