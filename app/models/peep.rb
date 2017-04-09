class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :experience, String
  property :created_at, DateTime
  property :created_on, Date

  belongs_to :user


  def self.chronological
    Peep.all.reverse
  end
end
