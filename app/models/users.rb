class User
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :username,   String,  :required => true, :unique => true
  property :email,      String,  :required => true, :unique => true 
  property :password,   String,  :required => true
end
