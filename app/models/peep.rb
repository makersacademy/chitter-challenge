require 'data_mapper'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :time, String
  property :author, String

  belongs_to :user

end
