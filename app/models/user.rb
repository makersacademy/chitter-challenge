
class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String
  property :email, Text
  property :password, Text
end

#:index=>true
