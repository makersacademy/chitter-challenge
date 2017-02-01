require 'data_mapper'

class Comment
  include DataMapper::Resource

  belongs_to  :peep
  belongs_to  :user

  property    :id,    Serial
  property    :text,  Text, length: 140
end
