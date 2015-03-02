require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id,    Serial
  property :text,  Text
  property :timestamp, DateTime
  

  belongs_to  :user

  def self.all_in_chron
    self.all.sort {|a,b|b.timestamp <=> a.timestamp}
  end

end