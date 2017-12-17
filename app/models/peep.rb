DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
require_relative './user.rb'

require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'time'


class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :time, Time
  property :author, String

   # has 1, :user , :through => Resource
end

DataMapper.finalize
DataMapper.auto_upgrade!
