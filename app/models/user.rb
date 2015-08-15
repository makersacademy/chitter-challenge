class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String

  validates_presence_of :name
  validates_presence_of :user_name
  validates_presence_of :email


end