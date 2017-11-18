require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'peep.rb'

class User
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :password, Text
  property :first_name, String
  property :last_name, String
  property :username, String

  has n, :peeps, :through => Resource
end

DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize
DataMapper.auto_upgrade!
