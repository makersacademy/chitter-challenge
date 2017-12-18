require './app/data_mapper_setup.rb'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, Time

  belongs_to :user
  has n, :tags, through: Resource

  attr_accessor :time_string
end
