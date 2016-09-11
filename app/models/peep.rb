require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, DateTime

  belongs_to :user

end
