require "data_mapper"
require "dm-postgres-adapter"

class Peep
  # functionality which lets a peep load on the website via datamapper
  # and postgres
  include DataMapper::Resource

  property :id, Serial
  property :message, String
# components of what a peep is comprised of
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitterchallenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
