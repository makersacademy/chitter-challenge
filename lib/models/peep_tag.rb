class PeepTag
  attr_accessor :peep_id, :tag_id

  def initialize(peep_id:, tag_id:)
    @peep_id = peep_id
    @tag_id = tag_id
  end
end