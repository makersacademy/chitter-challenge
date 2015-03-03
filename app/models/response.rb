require_relative 'peep'
require_relative 'user'

class Response

  include DataMapper::Resource

  property :id,    Serial
  property :text,  Text
  property :timestamp, DateTime
  

  belongs_to  :user
  belongs_to  :peep

end