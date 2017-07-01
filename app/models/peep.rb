require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :created_on, Date

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.auto_upgrade!
