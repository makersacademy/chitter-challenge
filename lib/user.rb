class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name,  String
  property :user_name, String

  has n, :peeps, :through => Resource

end