require 'data_mapper'
require 'dm-validations'

class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :text,       Text, :required => true
  property :time_stamp, DateTime
  property :reply,      Boolean, :default  => false
  property :replied_id, Integer
  property :replied_to, String

  belongs_to :user, :required => true

end
