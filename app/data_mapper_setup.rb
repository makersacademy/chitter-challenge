require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep'
require_relative 'models/user'

# Now let's set up a connection with a database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
