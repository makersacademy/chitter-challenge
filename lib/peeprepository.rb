class PeepRepository
  def initialize
    @all_peeps = []
  end

  def add(peep)
    @all_peeps.push(peep)
  end

  def all
    return @all_peeps
  end
end
