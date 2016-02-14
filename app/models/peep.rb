# require_relative '../data_mapper_setup.rb'
require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  # has n, :tag, through: Resource

  property :id,   Serial
  property :peep, String, required: true
  property :posted, DateTime, :default => lambda{ |p,s| DateTime.now}

end
