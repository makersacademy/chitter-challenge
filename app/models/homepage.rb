require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative 'models/user'

class Homepage #class corresponds to a table in the database
  include DataMapper::Resource #add datamapper functionality so it can communicate with database

  property :id,        Serial #automatically incremented with seriel
  property :message,   Text
  property :posted_at, DateTime

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}") #setup connection with database
DataMapper.finalize #checks everything is ok
DataMapper.auto_upgrade! #builds new columns and table we added
