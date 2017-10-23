require "data_mapper"
require "dm-postgres-adapter"
require "dm-timestamps"

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  # def time_to_string(time = created_at)
  #   "Created at #{time.strftime("%R")} on #{time.strftime("%d/%-m/%-y")}"
  # end
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitterchallenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
