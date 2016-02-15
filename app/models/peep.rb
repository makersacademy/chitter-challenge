require 'data_mapper'
require 'dm-postgres-adapter'
require 'time'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, required: true
  property :date, Time, required: true

  belongs_to :user, :required => true

end