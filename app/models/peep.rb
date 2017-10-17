class Peep

  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  def author
   User.get(user_id).user_name
  end

  def time
    c = created_at
    "#{c.hour}:#{c.minute} #{c.day}-#{c.month}-#{c.year}"
  end
end
