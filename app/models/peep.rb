class Peep

  include DataMapper::Resource

  attr_reader :time

  property :id,               Serial
  property :peep,             String
  property :time,             Time
  property :name,             String
  property :username,         String

  def time
    self.time = Time.now
  end
end
