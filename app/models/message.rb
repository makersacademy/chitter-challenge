require 'data_mapper'
require 'dm-postgres-adapter'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :time, DateTime
  property :content, String

  belongs_to :user

end
