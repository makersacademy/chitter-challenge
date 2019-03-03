require 'pg'
require 'data_mapper'
require 'time'

class Peep
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :name,      String    # A varchar type string, for short strings
  property :handle,      String    # A varchar type string, for short strings
  property :peep_text,       String      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.

  attr_reader :name, :handle, :peep_text, :peep_time
  DataMapper.finalize
end