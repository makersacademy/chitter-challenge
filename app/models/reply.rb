class Reply 
  include DataMapper::Resource
  
  property :id, Serial
  property :reply_text, Text, :required => true
  property :date_time, DateTime
  
  belongs_to :user
  belongs_to :peep


  def <=>(other)
    return 1 if date_time < other.date_time
    return 0 if date_time == other.date_time
    return -1
  end
end