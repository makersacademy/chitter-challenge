  env = ENV['RACK_ENV'] || 'development'
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
  require './app/models/user'
  require './app/models/cheep'
  DataMapper.finalize
  DataMapper.auto_upgrade!