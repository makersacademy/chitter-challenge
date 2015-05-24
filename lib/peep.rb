class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep_text, String
  property :username, String
  property :name, String

end