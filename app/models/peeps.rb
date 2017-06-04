class Peep
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String
  property :peep, Text
  property :time, DateTime
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
