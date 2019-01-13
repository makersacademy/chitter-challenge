require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  def time
    created_at.strftime('%d-%m-%Y %H:%M:%S')
  end
end
