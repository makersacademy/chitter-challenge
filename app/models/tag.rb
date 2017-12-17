require './app/data_mapper_setup.rb'

class Tag
  include DataMapper::Resource

  property :id, Serial

  belongs_to :peep, required: false
  belongs_to :user, required: false

end
