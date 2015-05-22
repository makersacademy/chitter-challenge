class User

  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :username,   String
  property :email,      String

end
