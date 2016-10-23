require_relative 'data_mapper_setup'
require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :title,    String
  property :time,     Time

  belongs_to :user

end
