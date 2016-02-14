class User

  include DataMapper::Resource

  property :id,                    Serial
  property :username,              Text
  property :name,                  Text
  property :email,                 Text
  property :password,              Text
  property :password_confirmation, Text

end
