class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :user_name,    String
  property :peep_text,    Text

end
