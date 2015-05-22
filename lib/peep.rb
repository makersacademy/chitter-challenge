class Peep

  include DataMapper::Resource

  property :peep_id, Serial
  property :peep_content, String
  property :created_at, DateTime

end
