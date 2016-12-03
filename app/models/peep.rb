require "data_mapper"
require "dm-postgres-adapter"
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, String, required: true
  property :time, String
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

  belongs_to :user
end
