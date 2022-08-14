class Peep
  attr_accessor :id, :content, :time, :user_id

  def initilize
    @time = Time.now
  end
end