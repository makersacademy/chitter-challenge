require 'data_mapper'
require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :message, Text
  property :created_at, DateTime

end