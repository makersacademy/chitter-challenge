require "data_mapper"
require "dm-postgres-adapter"
require 'dm-timestamps'

class Comment
  include DataMapper::Resource
  belongs_to :peep

  property :id, Serial
  property :comment, String, required: true
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

end
