class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :text, Text
  property :time, DateTime, default: DateTime.now

  belongs_to :user

  def self.desc
    all(:order => [ :time.desc ])
  end
end
