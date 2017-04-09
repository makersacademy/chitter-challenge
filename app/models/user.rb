class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :nom_name, String

end
