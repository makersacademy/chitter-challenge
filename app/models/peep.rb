class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :peep, String
  property :time, Text

  # def time=(time)
  #   self.time_stamp = time
  # end

end
