require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text, required: true
  property :timestamp, String

  has n, :comments

  def self.save_instance(instance)
    @peep_being_viewed = instance
  end

  def self.current
    @peep_being_viewed
  end
end
