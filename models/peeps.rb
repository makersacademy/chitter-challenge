# require 'dm-migrations'
# require 'data_mapper'
# require 'dm-postgres-adapter'
# require 'dm-timestamps'
#
#
# class Peeps
#   include DataMapper::Resource
#
#   property :id, Serial
#   property :content, Text
#   property :created_at, DateTime
#
# end
#
# DataMapper.setup(:default, "postgres://localhost/chitter")
# DataMapper.finalize
# DataMapper.auto_upgrade!
