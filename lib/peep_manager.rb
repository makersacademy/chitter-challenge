class PeepManager
  def self.instance
    @instance ||= new
  end

  def initialize
    @peeps = []
  end

  def all_peeps
    @peeps.reverse
  end

  def create(peep)
    @peeps << peep
  end
  
  # def all_peeps_by_maker
  #   @peeps.select.reverse do |peep|
  #     peep.maker_id.include?(peep)
  #   end
  # end
end
