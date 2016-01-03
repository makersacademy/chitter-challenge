require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer
  property :peep, Text

  belongs_to :user
end
