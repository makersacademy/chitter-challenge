class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :time_created, Time
end
