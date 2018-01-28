
class Peep

  include DataMapper::Resource

  property :id,   Serial
  property :message, String

  # attr_reader :message

end
