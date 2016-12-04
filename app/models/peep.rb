require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime

  @@peep_count = 0

  def initialize(params)
    self.peep = params[:peep]
    @@peep_count += 1
  end



end
