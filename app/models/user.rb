class User
  include DataMapper::Resource

  property(:id, Serial)
  property(:real_name, String)
  property(:username, String)
  property(:email_address, String)
  property(:password, Text)

end
