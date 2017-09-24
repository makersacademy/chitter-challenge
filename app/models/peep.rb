class Peep
  include DataMapper::Resource

  property :id,           Serial
#  property :name,         String
#  property :user_name,    String
  property :peep_text,    Text, :length => 1..140
  property :created_at,   DateTime

end
