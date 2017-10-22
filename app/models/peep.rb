class Peep
  
  include DataMapper::Resource
  
  property :id, Serial
  property :peep_text, Text
  property :date_time, DateTime
  
  belongs_to :user

  def <=>(other_peep)
    return 1 if self.date_time < other_peep.date_time
    return 0 if self.date_time == other_peep.date_time
    return -1
  end

end  
