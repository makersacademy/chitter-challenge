require 'data_mapper'
require 'dm-postgres-adapter'

class Homepage #class corresponds to a table in the database
  include DataMapper::Resource #add datamapper functionality so it can communicate with database

  property :id,       Serial #automatically incremented with seriel
  property :message,  Text

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}") #setup connection with database
DataMapper.finalize #checks everything is ok
DataMapper.auto_upgrade! #builds new columns and table we added
