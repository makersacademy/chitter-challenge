class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :creation_time, DateTime
  property :user, Class
end