require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

    property :id, Serial
   property :msg, String
   property :time_stamp, DateTime

   # belongs to :user

end
