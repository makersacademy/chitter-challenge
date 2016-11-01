require 'dm-postgres-adapter'
require 'data_mapper'
require_relative 'datamapper_setup'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :time, Time
  property :text, Text

  belongs_to :user

end
