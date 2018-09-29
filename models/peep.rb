class Peep
  include DataMapper::Resource
  property :id, Serial
  property :text, Text
  property :time, DateTime

  def self.add(message)
    self.create(text: message, time: Time.now)
  end
end
