require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,    Serial
  property :content,  Text
  property :created_timedate, DateTime

  belongs_to :user

  def time_format
    time = self.created_timedate
    time.strftime("%I:%M%p %A %d/%m/%Y")
  end
end
