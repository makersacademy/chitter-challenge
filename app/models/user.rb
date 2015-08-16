class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String

  validates_presence_of :email
end