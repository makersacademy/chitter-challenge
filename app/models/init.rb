require 'rubygems'
require 'data_mapper'
require 'dm-validations'

require_relative 'user'
require_relative 'peep'
require_relative 'reply'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
