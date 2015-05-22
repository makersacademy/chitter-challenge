require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :text,       String

  belongs_to :user

end
