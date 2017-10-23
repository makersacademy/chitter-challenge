require 'data_mapper'
require 'dm-postgres-adapter'
require 'database_cleaner'

class Peep
  include DataMapper::Resource

  property :id,      Serial
  property :time,    String
  property :message, String

end

DatabaseCleaner.strategy = :truncation
