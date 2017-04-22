class Reply

  include DataMapper::Resource

  belongs_to :user
  belongs_to :peep

  property :id, Serial
  property :text, Text, :length => 140
  property :time, String

  def self.set_time
    time = Time.now
    time.strftime("posted at %-H:%M on %d %b '%y")
  end
end
