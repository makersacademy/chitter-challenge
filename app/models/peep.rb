require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

    include DataMapper::Resource

    property :username, String
    property :name, String
    property :message, Serial
    property :created_at, DateTime
end
