class Peep

  include DataMapper::Resource

  property :id,           Serial
  property :message,      String
  property :time_stamp,   String

  def self.time
    Time.new.strftime("...on %d/%m/%Y at %k:%M")
  end

  belongs_to :user

end
