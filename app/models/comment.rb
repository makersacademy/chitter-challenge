class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, length: 140, required: true
  property :time_posted, Time,
           default: proc { Time.now }

  belongs_to :user
  belongs_to :peep

  def time
    self.time_posted.strftime("%R %d/%m/%Y")
  end
end
