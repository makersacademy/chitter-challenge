require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-timestamps'
class Peep
  include DataMapper::Resource
    property :id, Serial
    property :peep_text, String
    property :time, Time

     belongs_to :user

    #validates_presence_of :user

end
