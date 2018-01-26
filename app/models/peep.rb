class Peep
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :peep, String
  property :time, Text

  # def time=(time)
  #   self.time_stamp = time
  # end

end
