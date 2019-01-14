require './lib/user'
require_relative '../lib/peep'
require 'data_mapper'
#
# DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# DataMapper.finalize
