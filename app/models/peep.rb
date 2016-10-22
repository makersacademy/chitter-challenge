require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

include DataMapper::Resource

property :author, String
property :id, Serial
property :comment, Text
property :created, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_test")
DataMapper.finalize
DataMapper.auto_upgrade!
