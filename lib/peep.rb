require 'data_mapper'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, DateTime

  belongs_to :user

end
