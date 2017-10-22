require 'data_mapper'

class Tag

  include DataMapper::Resource

  property :id, Serial

  belongs_to :peep, :key => true
  belongs_to :user, :key => true

end