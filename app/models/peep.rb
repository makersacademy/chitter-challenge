require 'dm-validations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep_text, String, length: 250, required: true

  belongs_to :user

end
