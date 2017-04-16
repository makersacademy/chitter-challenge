class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def self.all_reverse
    self.all(order: :created_at.desc)
  end
end
