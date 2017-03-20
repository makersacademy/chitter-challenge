require './app/data_mapper_setup'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  has n, :users, through: Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime
  property :user_name, String

end
