
class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  belongs_to :user

  def format_time(time)
    time.strftime('%a %e %B, %H:%M')
  end

  def self.reverse_order
    self.all(:order => :created_at.desc)
  end

end
