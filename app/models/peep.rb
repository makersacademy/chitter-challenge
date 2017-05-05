class Peep
  include DataMapper::Resource


  property :id, Serial
  property :pweep, Text
  property :time, String
  property :created_at, DateTime

  belongs_to :user
  # def self.all_in_reverse_order
  #   self.all(order: :created_at.desc)
  # end

end

