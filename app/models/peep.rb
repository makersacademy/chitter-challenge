require 'dm-postgres-adapter'
require 'data_mapper'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, String, :length => 150, message: "You have been peeping for too long, please control yourself to 150 characters!"
  property :created_at, DateTime

end
