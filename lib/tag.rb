require_relative './database_connection'

class Tag
  attr_reader :id, :tag

  def initialize(id, tag)
    @id = id
    @tag = tag
  end

  def self.create(tag)
    result = DatabaseConnection.query("INSERT INTO nuttags (tag) VALUES('#{tag}') RETURNING id, tag")
    Tag.new(result[0]['id'], result[0]['tag'])
  end

  # finds squiggle IDs based on tag name, returning a list of IDs

  def self.squiggles_tagged(tag)
    result = DatabaseConnection.query("SELECT squiggle_id FROM nuttags JOIN squiggles_tags ON nuttags.id = squiggles_tags.nuttag_id WHERE tag = '#{tag}';")
    result.map { |id| id['squiggle_id'] }
  end
  # def self.find(name)
  #   result = DatabaseConnection.query("SELECT * FROM nuttags WHERE tag = '#{name}'")
  #   result.map { |tag| Tag.new(tag['id'], tag['tag']) }
  # end
  #
  # def squiggles
  #   result = DatabaseConnection.query("SELECT squiggles.id, user_id, squiggle, time FROM squiggles_tags INNER JOIN squiggles ON squiggles.id = squiggle_tags.squiggle_id WHERE squiggle_tags.tag_id = #{@id};")
  #   result.map { |squiggle| Squiggle.new(squiggle['id'], squiggle['user_id'], squiggle['squiggle'], squiggle['time']) }
  # end
end
