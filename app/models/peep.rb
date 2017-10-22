require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
    include DataMapper::Resource
    property :id, Serial
    property :message, String
    property :name, String
    property :created_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
