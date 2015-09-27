class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, length: 140
  property :time, Time
  belongs_to :user

  # def format_time(time)
  #   time.strftime("%I:%M%p")
  # end

end
