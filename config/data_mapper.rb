
ENV['RACK_ENV'] ||= 'development'

require './lib/chitter_board'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
