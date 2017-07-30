class Peep

  include DataMapper::Resource

  property :id,           Serial
  property :message,      String, required: true
  property :time_stamp,   String

  validates_presence_of :message

  def self.time
    Time.new.strftime("...on %d/%m/%Y at %k:%M")
  end

  belongs_to :user

end
