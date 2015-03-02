require_relative 'user'
require_relative 'response'

class Peep

  include DataMapper::Resource

  property :id,    Serial
  property :text,  Text
  property :timestamp, DateTime
  
  has n, :responses
  belongs_to  :user

  def self.all_in_chron
    self.all.sort {|a,b|b.timestamp <=> a.timestamp}
  end

end