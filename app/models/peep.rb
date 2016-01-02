class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, length: 140, required: true

end
