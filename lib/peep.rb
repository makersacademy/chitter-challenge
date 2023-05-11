class Peep
  attr_accessor :id, :content, :time_posted, :user_id, :user

  def formatted_time
    return nil if @time_posted.nil?
    @time_posted.strftime('%d %b %Y at %H:%M')
  end
end
