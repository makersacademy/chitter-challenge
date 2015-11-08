require_relative '../data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time_stamp, Time
end
