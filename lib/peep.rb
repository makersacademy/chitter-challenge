require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :created_at, DateTime

  def format_time
    created_at.strftime('%d-%m-%y %H:%M:%S')
  end
end
