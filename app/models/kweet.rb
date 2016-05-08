require './app/data_mapper_setup'


class Kweet
  include DataMapper::Resource

  validates_presence_of :owner
  validates_presence_of :message
  validates_length_of :message, :within => 0..140

  property    :id, Serial
  property    :message, String, required: true
  property    :owner, String, required: true
  property    :created_at, DateTime

end
