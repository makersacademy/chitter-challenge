class Hoot

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :message, String

end