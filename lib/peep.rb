require 'pg'
require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :name,      String    # A varchar type string, for short strings
  property :handle,      String    # A varchar type string, for short strings
  property :peep_text,       String      # A text block, for longer string data.
  property :peep_time, String  # A varchar type string, for short strings

  attr_reader :name, :handle, :peep_text, :peep_time
  DataMapper.finalize
end