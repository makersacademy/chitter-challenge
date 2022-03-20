class PeepManager
  NO_PEEPS_MESSAGE = 'No peeps, yet...'

  def peep_count
    @peeps.length
  end

  def add(content)
    @peeps << content
  end

  def all_peeps
    peep_count == 0 ? [NO_PEEPS_MESSAGE] : @peeps
  end

  def self.instance
    @manager ||= PeepManager.new
  end

  private

  def initialize
    @peeps = []
  end
end