# require 'data_mapper'
# require 'dm-postgres-adapter'
# require 'dm-migrations'
# require './models/user.rb'
#
# class Peep
#   include DataMapper::Resource
#
# belongs_to :user
#
#   property :id,   Serial
#   property :peep, Text
#   property :time, Time
#
# end
#
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# DataMapper.auto_upgrade!
