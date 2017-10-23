class Peep
  include DataMapper::Resource
  belongs_to :maker

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def time_stamp
    t = created_at
    t.strftime("%I:%M%p, %m/%d/%Y")
  end

end
