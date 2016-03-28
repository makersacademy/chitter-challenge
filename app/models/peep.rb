class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, length: 140, required: true
  property :time_posted, Time,
           default: proc { Time.now }

  has n, :comments
  belongs_to :user

  def time
    self.time_posted.strftime("%R %d/%m/%Y")
  end
end
