require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, String, length: 140, required: true
  property :time_posted, Time

  belongs_to :user

end
