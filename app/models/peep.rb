class Peep
  include DataMapper::Resource

  TIME = Time.new

  property :id, Serial
  property :pweep, String


  def time_of_post
    "#{TIME.hour}:#{TIME.min}, #{TIME.day}-#{TIME.month}-#{TIME.year}"
  end


end

