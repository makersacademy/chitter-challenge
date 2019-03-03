class Peep

  @peeps = ['Trump is a nob', 'Code is cool', 'Save the turtles']

  def self.all
    @peeps
  end

  def self.create(peep:)
    @peeps << peep
  end


end
