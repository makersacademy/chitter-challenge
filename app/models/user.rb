class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true

end
