env = ENV["RACK_ENV"] || "development"
postgres_url = "postgres://localhost/chitter_#{env}"
# we're telling datamapper to use a postgres database on localhost.
# The name will be "bookmark_manager_test" or "bookmark_manager_development"
# depending on the environment
# DataMapper::Logger.new(STDOUT, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres_url)
# After declaring your models, you should finalise them
DataMapper.finalize
