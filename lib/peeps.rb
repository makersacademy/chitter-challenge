require 'pg'

# class for peep object
class Peeps

  @peeps = []

  def self.post_peep(peep)
    @peeps << peep
  end

  def self.peep_list
    # printed in reverse chronological order
    @peeps.reverse
  end
end
