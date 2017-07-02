require 'data_mapper'


class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime

  # belongs_to :post

  def time_stamp
    "#{created_at.strftime("%I:%M %p %b %d, 20%y")}"
  end
end
