require 'data_mapper'

class Peep
  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  def time
    "#{created_at.hour}:#{created_at.minute} #{created_at.day}-#{created_at.month}-#{created_at.year}"
  end
end
