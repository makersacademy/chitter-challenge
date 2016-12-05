require 'data_mapper'
require 'dm-postgres-adapter'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :content, String

  belongs_to :user

end
