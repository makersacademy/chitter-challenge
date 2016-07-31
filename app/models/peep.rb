class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :user_name,  String
  property :peep,       String
end
