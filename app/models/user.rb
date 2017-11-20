class User
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :password, Text

end
