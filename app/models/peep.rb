require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user_peep, Text
  property :created_at, DateTime

  @@peep_count = 0

  def initialize(params)
    self.user_peep = params[:user_peep]
    @@peep_count += 1
  end



end
