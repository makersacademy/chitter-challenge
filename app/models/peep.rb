require 'data_mapper'

class Peep
  include DataMapper::Resource

  has n,      :comments
  belongs_to  :user

  property    :id,    Serial
  property    :text,  Text, length: 140
  property    :time,  Time
end
