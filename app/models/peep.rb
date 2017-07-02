require 'data_mapper'

class Peep
  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  def time
    c = created_at
    "#{c.hour}:#{c.minute} #{c.day}-#{c.month}-#{c.year}"
  end

  def author
    User.get(user_id).username
  end
end
