require 'data_mapper'
require 'dm-postgres-adapter'

class Comment
include DataMapper::Resource

property  :id,          Serial
property  :message,     String

end
