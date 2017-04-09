class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text
  attr_accessor :password_confirmation

end
