require 'data_mapper'
require './app/data_mapper_setup'

class Reply

  include DataMapper::Resource

  property :id,           Serial
  property :reply,        Text

  belongs_to :peep

end
