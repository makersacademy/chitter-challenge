require 'pg'

class Peep

  attr_reader :id, :peep, :peeped_at, :peeped_by

  def initialize(id:, peep:, peeped_at:, peeped_by:)
    @id = id
    @peep = peep
    @peeped_at = peeped_at
    @peeped_by = peeped_by
  end

end
