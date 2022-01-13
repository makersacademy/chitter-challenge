class PeepTag

  attr_reader :peep_id, :tag_id

  def initialize(peep_id:, tag_id:)
    @peep_id = peep_id
    @tag_id = tag_id
  end

  def self.create(peep_id:, tag_id:)
    result = DatabaseConnection.query(
"INSERT INTO peep_tags (peep_id, tag_id) VALUES($1, $2) RETURNING peep_id, tag_id;", [peep_id, 
tag_id])
    PeepTag.new(peep_id: result[0]['peep_id'], tag_id: result[0]['tag_id'])
  end
end
