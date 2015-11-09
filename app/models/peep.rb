require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text, required: true, lazy: false
  property :time, Text, required: true, lazy: false

  belongs_to :user

end
