  #DataMapper::Logger.new($stdout, :debug)

  environment = ENV['RACK_ENV'] || 'development'

  # Read into what this line does, ways of setting up multiple environments

  DataMapper.setup(:default, "postgres://localhost/chatter_#{environment}")

  require './app/model/chatter_user'
  require './app/model/peep'

  DataMapper.finalize
  DataMapper.auto_upgrade!
  #DataMapper.auto_migrate!