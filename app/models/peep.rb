
class Peep
  include DataMapper::Resource

  property(:id, Serial)
  property(:body, String)
  property(:created_at, DateTime)

  belongs_to :user, required: false

  def time_stamp
    created_at.strftime('on %F at %H:%M)')
  end
end
