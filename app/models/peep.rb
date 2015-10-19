class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :time, DateTime, :default => lambda{ |p,s| DateTime.now}
  property :peep, String, length: 1..140

  attr_reader :peep
  attr_reader :time

  belongs_to :user

end
