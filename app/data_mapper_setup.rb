env = ENV["RACK_ENV"] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter-challenge_#{env}")

#require_relative 'models/peep'


DataMapper.finalize

DataMapper.auto_upgrade!