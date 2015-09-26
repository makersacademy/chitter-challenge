

class Peep

#Corresponds to a peep table in the database

  include DataMapper::Resource

  property :id, Serial
  property :message, Text



end
