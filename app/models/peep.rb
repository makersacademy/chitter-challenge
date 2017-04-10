class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :required => true
  property :created_at, DateTime


  belongs_to :user, :required => true

  def self.all_in_reverse_order
    self.all(order: :created_at.desc)
  end
end
