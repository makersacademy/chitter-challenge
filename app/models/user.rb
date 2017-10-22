require 'data_mapper'
require 'dm-postgres-adapter'
require 'database_cleaner'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :username, String
  property :email,    String
  property :password, String
end

DatabaseCleaner.strategy = :truncation
