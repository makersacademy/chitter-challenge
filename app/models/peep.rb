require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # these property declarations set the column headers in the 'peeps' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :message,    String

  # Now let's set up a connection with a database
  DataMapper.setup(:default, "postgres://localhost/chitter_challenge_test")
  # Let's check that everything we wrote in our models was OK
  DataMapper.finalize
  # And let's build any new columns or tables we added
  DataMapper.auto_upgrade!

end
