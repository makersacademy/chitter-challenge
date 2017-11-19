require "data_mapper"
require "database_cleaner"
require "dm-migrations"
require "dm-postgres-adapter"
require "dm-transactions"

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/peep_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
