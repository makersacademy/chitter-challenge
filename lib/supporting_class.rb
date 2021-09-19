require 'date'

class AncilliaryClass 

  def initialize
    @avatar_names = 
    ['beaver','elephant','hippo','stag',
      'lion','flamingo','tiger','salamander','panda']
    @date = Date.today.strftime("%d/%m/%Y")
    @time = Time.now.strftime("at %I:%M %p") 
  end 

  def avatar
    "Unknown #{@avatar_names.sample.capitalize}"
  end

  def time_date
    "#{@date} #{@time} "
  end

end
