class MakerManager
  def self.instance
    @instance ||= new
  end

  def initialize
    @makers = []
  end

  def all_makers
    @makers
  end
  
  def create(maker)
    @makers << maker
  end

  def delete(maker)
    @makers.delete(maker)
  end
# ------ login/out stretch goal --------
#   def login(maker)
#     #tbd
#   end

#   def logout(session)
#     #tbd
#   end
end
