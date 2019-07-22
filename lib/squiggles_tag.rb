require_relative './database_connection'
require_relative './squiggle'
require_relative './tag'

class SquiggleTag
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.create(squiggle_id,tag_id)
    result = DatabaseConnection.query("INSERT INTO squiggles_tags (squiggle_id, nuttag_id) VALUES('#{squiggle_id}', '#{tag_id}') RETURNING id")
    SquiggleTag.new(result[0]['id'])
  end
end
