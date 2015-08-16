require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, 'postgres://pkpwxhgyetnnkb:nPMqDTV2tsJH_AFupc7uwmD2oD@ec2-54-235-147-211.compute-1.amazonaws.com:5432/d9sovkja62a4i0' || "postgres://localhost/chitter_#{env}")


require './app/models/peep'
require './app/models/user'
require 'dm-validations'


DataMapper.finalize

DataMapper.auto_upgrade!