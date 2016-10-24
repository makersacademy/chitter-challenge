require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # these property declarations set the column headers in the 'peeps' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :user_name,  String
  property :user_peep,    String

end
