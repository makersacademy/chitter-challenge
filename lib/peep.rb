class Peep
  attr_accessor :id, :content, :date_time, :user_id
  def initialize
    @date_time = DateTime.now
  end
end