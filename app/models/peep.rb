require "data_mapper"
require "database_cleaner"
require "dm-migrations"
require "dm-postgres-adapter"
require "dm-transactions"

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
end

DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/peep_test")
DataMapper.finalize
DataMapper.auto_upgrade!
