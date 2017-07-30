require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/peep'
# Now let's set up a connection with a database
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
