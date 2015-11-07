class Peep
  include DataMapper::Resource

  property :id, Serial
  property :time, String
  property :name, String
  property :content, Text

end
