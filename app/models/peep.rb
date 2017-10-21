require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

    include DataMapper::Resource

    property :id, Serial
    property :message, Text
    property :time_posted, DateTime

end


DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
