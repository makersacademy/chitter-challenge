require "data_mapper"
require "dm-postgres-adapter"
require "./spec/spec_helper"
require "./app"

require_relative "models/peep"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitterchallenge_#{ENV[‘RACK_ENV’]}")
DataMapper.finalize
DataMapper.auto_upgrade!
