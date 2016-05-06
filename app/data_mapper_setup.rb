# require_relative './models/peep'
require_relative './models/user'

p ENV['RACK_ENV']

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize