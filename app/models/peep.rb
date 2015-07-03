require 'data_mapper'
require 'dm-validations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :text, Text, unique: true, message: 'You already chittered that'
  property :time_stamp, DateTime

  belongs_to :user, :required => true

end
