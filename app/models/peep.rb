
require 'dm-timestamps'

class Peep

  include DataMapper::Resource


  property :id, Serial
  property :message, String, required: true
  property :created_on, DateTime

  belongs_to :user

end
