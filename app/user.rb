class User
  include DataMapper::Resource

  property :id,         Serial
  property :user_name,  String
  property :email,      String
  property :password,   Text

end
