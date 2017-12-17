require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'


class Tweet
  include DataMapper::Resource

  property :id,           Serial
  property :message,      String
  property :time,         String

  belongs_to :user, required: false

end
