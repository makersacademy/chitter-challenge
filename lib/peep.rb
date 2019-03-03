require 'data_mapper'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :peep_text,  String      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.

  belongs_to :user
end