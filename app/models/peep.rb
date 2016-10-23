class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep_text, Text
  # property :date, Time
end
