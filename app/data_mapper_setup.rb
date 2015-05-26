#  checking what environment we're in, and defaulting to development:
env = ENV['RACK_ENV'] || 'development'
# we're telling datamapper to use a postgres database on localhost.
# The name will be "chitter_test" or "chitter_development" depending
# on the environment
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

DataMapper.finalize # After declaring your models, you should finalise them
# However, the database tables don't exist yet. Tell datamapper to create them
DataMapper.auto_upgrade!
