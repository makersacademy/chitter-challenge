require './app/data_mapper_setup.rb'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep_name, String
  property :time, String
  property :last_maker, String
  property :user_name, String

  belongs_to :maker, required: false

end
