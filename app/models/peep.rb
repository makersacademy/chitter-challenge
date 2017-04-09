class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :experience, String
  property :created_at, DateTime
  property :created_on, Date

  def self.chronological
    Peep.all.reverse
  end
end
