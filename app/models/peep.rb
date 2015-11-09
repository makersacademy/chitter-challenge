require_relative '../data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :name, String
  property :user_name, String
  property :time_stamp, Time
end
