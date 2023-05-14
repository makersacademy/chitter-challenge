class Peep
  attr_accessor :id, :message, :timestamp, :peep_id, :user_id, :user, :reply_count, :tags

  def initialize
    @tags = []
  end
end
