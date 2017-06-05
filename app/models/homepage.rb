
# require_relative 'models/user'

class Homepage #class corresponds to a table in the database
  include DataMapper::Resource #add datamapper functionality so it can communicate with database

  property :id,        Serial #automatically incremented with seriel
  property :message,   Text
  property :created_at, DateTime

end
