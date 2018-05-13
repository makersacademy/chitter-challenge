class Comment
  include DataMapper::Resource

  property :id,     Serial
  property :text,   String
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :user
  belongs_to :peep

  def time
    self.created_at.strftime("%H:%M")
  end
  
end
