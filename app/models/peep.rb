require 'data_mapper'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,    Serial
  property :text, String
  property :time_stamp, DateTime

  belongs_to :user, :key => true 


end
