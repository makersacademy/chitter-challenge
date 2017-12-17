require './app/data_mapper_setup.rb'

class Peep
  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :message, String
  property :created_at, DateTime
  property :user_id, String


end
