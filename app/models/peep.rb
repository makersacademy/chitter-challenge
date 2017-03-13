class Peep
  include DataMapper::Resource

  has n, :hashtags, through: Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def self.reverse
    self.all(order: :created_at.desc)
  end

  belongs_to :user

end
