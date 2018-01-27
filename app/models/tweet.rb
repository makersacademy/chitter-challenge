require 'data_mapper'
require 'dm-postgres-adapter'

class Tweet
  include DataMapper::Resource

  property :id, Serial
  property :subject, String
  property :text, String

end
