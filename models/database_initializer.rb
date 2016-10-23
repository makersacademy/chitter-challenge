def database_setup
  # this connects the model to the database (on the hard drive)
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  # DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
  # this checks models for validity (checks you've written your code in the correct syntax)
  # and initialises properties (id) with relationships (serial)
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.finalize
  # this works with the dm-migrations gem, which is part of the datamapper gem,
  # and creates the tables within the linked database
  DataMapper.auto_upgrade!
end
