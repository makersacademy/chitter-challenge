require 'sinatra'
require 'data_mapper'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require_relative './models/user.rb'
require_relative './models/peep.rb'

DataMapper.finalize



