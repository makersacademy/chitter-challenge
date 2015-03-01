  env = ENV['RACK_ENV'] || 'development'
  DataMapper.setup(:default, "postgres://tjazqcxmtuqzvm:zflznKcp6tP24pk-74jgtA0jMM@ec2-107-21-93-97.compute-1.amazonaws.com:5432/d9csv0cgk3q1uq")
  require './app/models/user'
  require './app/models/cheep'
  DataMapper.finalize
  DataMapper.auto_upgrade!