class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :when, DateTime, :default => lambda{ |p,s| DateTime.now}
  property :peep, String, length: 1..140

  attr_reader :id
  attr_reader :peep
  attr_reader :when
  #belongs_to :user

end
