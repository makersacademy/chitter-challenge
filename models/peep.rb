class Peep
  include DataMapper::Resource
  property :id, Serial
  property :text, Text
  property :time, Time

  def self.add(message)
    Peep.create(text: message, time: Time.now) unless message.strip.empty?
  end

  def self.all_sorted
    Peep.all.sort { |peep_1, peep_2| peep_2.id <=> peep_1.id }
  end

  def time_format
    time.strftime("Posted at %e-%m-%y %H:%M")
  end
end
