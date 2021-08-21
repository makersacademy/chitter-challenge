class Tag
  attr_reader :tag_id, :peep_fk

  def initialize(tag_id:, peep_fk:)
    @tag_id = tag_id
    @peep_fk = peep_fk
  end

  def self.create(peep_fk:)
    result = DatabaseConnection.query("
      INSERT INTO tags (peep_fk) VALUES ($1) 
      RETURNING tag_id, peep_fk", 
      [peep_fk])
    tag = Tag.new(
      tag_id: result[0]['tag_id'], 
      peep_fk: result[0]['peep_fk'])
    end
end
