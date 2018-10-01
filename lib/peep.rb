require 'data_mapper'
require_relative 'database_connect'
require 'pg'

class Peep

  include DataMapper::Resource

property :id,           Serial
property :peep,         String
property :created_at,   DateTime
# property :created_by,   String
# property :username,     String


end

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize
DataMapper.auto_upgrade!
