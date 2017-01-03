require "data_mapper"
require "dm-postgres-adapter"
require 'dm-timestamps'

class Peep
  include DataMapper::Resource
  has n, :comments
  belongs_to :user

  property :id, Serial
  property :peep, String, required: true
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date


end
