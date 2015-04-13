require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, String

  belongs_to :user

end