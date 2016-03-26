require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../data_mapper_setup'

class Poop
  include DataMapper::Resource
  
  property :id, Serial
  property :poop_msg, String
  property :username, String
  property :time_posted, Date

end


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{RACK_ENV}")
DataMapper.finalize
DataMapper.auto_upgrade!
