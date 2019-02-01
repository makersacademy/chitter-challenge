require 'data_mapper'
require_relative 'database_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text

end

DataMapper.auto_upgrade!
