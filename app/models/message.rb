require './app/data_mapper_setup.rb'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, Time

  attr_accessor :time_string
end
