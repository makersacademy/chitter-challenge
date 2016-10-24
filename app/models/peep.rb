require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :timePosted, Time
  property :content, String, :length => 1..150

  belongs_to :user
end
