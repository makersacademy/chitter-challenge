# require 'spec_helper'
require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time, Time

end
