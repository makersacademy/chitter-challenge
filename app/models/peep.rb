require_relative '../data_mapper_setup'
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :mess, Text
  property :created_at, Time

  belongs_to :user
end
