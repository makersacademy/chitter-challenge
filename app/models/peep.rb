require 'date'
require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :posted_on, DateTime

  belongs_to :user

end