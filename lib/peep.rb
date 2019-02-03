require 'data_mapper'
require_relative 'database_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :posted_at, String

end

DataMapper.auto_upgrade!
