
class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  belongs_to :user

  def format_time(time)
    time.strftime('%a %e %B, %H:%M')
  end

end
