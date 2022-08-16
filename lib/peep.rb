class Peep
  attr_accessor :id, :content, :time, :user_id

  def initialize
    @time = Time.now
  end
end