require './app/data_mapper_setup.rb'

class Tag
  include DataMapper::Resource

  property :id, Serial

  belongs_to :peep
  belongs_to :user

end
