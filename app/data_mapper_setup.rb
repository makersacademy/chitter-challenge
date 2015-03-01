  env = ENV['RACK_ENV'] || 'development'
  DataMapper.setup(:default, DATABASE_URL)
  require './app/models/user'
  require './app/models/cheep'
  DataMapper.finalize
  DataMapper.auto_upgrade!