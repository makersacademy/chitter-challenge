class Peep

  include DataMapper::Resource

  belongs_to :user

  has n, :responses

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

  def self.all_in_reverse_order
    self.all(order: :timestamp.desc)
  end

end
