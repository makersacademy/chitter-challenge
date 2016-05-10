require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, String
  property :time, Time

  belongs_to :user
end
