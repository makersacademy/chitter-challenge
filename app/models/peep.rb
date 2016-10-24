class Peep

  include DataMapper::Resource

  belongs_to :user

  has n, :responses, through: Resource

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

  def self.all_in_reverse_order
    self.all(order: :created_at.desc)
  end

end
