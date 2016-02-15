require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, length: 500, required: true, message: 'content'
  property :creation, DateTime, message: 'datetime'
  belongs_to :user

  def self.reverse_time_order
    all(order: [:creation.desc])
  end

end
