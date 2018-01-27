require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Tweet
  include DataMapper::Resource

  property :id, Serial
  property :subject, String
  property :text, String
  property :created_at, Time

end
