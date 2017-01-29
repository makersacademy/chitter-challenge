require 'dm-validations'
require 'dm-timestamps'

class Peep

  MAX_PEEP_PER_PAGE = 10

  include DataMapper::Resource

  property :id, Serial
  property :peep_text, String, length: 250, required: true
  property :created_at, Time

  belongs_to :user

end
