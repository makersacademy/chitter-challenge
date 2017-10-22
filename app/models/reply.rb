require 'data_mapper'

class Reply

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  
  belongs_to :peep, :key => true
  belongs_to :user, :key => true

end