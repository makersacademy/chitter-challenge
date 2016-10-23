require 'data_mapper'
require 'dm-postgres-adapter'

class Message
  include DataMapper::Resource

  property :id,      Serial
  property :title,   Text
  property :content, Text

end
