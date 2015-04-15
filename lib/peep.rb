class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :body, Text
  property :created_at, Time

  belongs_to :user

  def self.reverse_chronological
    self.all(order: [:created_at.desc])
  end

end