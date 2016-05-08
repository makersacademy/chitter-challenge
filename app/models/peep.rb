require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time_posted, Time
  property :username, String

  belongs_to :user

end
