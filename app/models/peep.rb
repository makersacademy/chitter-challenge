require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time, String
  property :peeper, String

  # belongs_to :user

  def short_time
   time[0..18]
  end

end

DataMapper.finalize
