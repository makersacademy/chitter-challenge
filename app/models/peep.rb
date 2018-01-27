require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :peep, String
  property :created_at, DateTime

  # def time=(time)
  #   self.time_stamp = time
  # end

end
