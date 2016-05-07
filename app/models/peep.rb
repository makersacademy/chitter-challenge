require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user, String, required: true
  property :message, String
  property :time_posted, String

  def self.time(time = Time)
    @time_posted = time.now.strftime("%I:%M%p,%e %b %Y")
  end

end
