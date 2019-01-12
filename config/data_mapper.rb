ENV['RACK_ENV'] ||= 'development'

require './lib/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
