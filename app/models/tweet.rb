require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'


class Tweet

  include DataMapper::Resource

  belongs_to :user
  property :id, Serial
  property :message, Text

end
