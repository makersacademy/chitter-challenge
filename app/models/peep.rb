class Peep

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :text, String
  property :time, String

  def self.set_time
    time = Time.now
    time.strftime("posted at %-H:%M on %d %b '%y")
  end
end
