require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String

  def initialize(message)
    @message = message
  end

  attr_reader :message
end
