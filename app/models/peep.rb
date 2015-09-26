require './app/data_mapper_setup'
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, Time

  belongs_to :user
end
