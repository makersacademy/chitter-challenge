class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :text, Text
  property :time, DateTime, default: DateTime.now

  belongs_to :user

  def self.desc
    all(:order => [ :time.desc ])
  end

  def time_ts
    time.strftime("%m %d, %Y, %H:%M")
  end
end
