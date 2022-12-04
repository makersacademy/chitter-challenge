class Peep
  attr_accessor :id, :contents, :time, :account_id

  def time
    if @time == nil
      Time.now
    else
      @time
    end
  end
end