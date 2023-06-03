require_relative '../models/peep_tag'
require 'database_connection'
require_relative 'tag_repository'
require_relative 'peep_repository'

class PeepTagRepository
  def self.create(peep_id, tag_id)
    query = "INSERT INTO peep_tags (peep_id, tag_id) VALUES ($1, $2);"
    DatabaseConnection.exec_params(query, [peep_id, tag_id])
  end

  def self.find_by_peep(peep_id)
    query = <<~SQL
      SELECT pt.peep_id, pt.tag_id, t.name
      FROM peep_tags pt
      JOIN tags t ON pt.tag_id = t.id
      WHERE pt.peep_id = $1;
    SQL
  
    result = DatabaseConnection.exec_params(query, [peep_id])
    build_peep_tags(result)
  end

  def self.find_by_tag(tag_id)
    query = <<~SQL
      SELECT pt.peep_id, pt.tag_id, t.name
      FROM peep_tags pt
      JOIN tags t ON pt.tag_id = t.id
      WHERE pt.tag_id = $1;
    SQL

    result = DatabaseConnection.exec_params(query, [tag_id])
    build_peep_tags(result)
  end

  def self.delete(peep_id, tag_id)
    query = "DELETE FROM peep_tags WHERE peep_id = $1 AND tag_id = $2;"
    DatabaseConnection.exec_params(query, [peep_id, tag_id])
  end

  private

  def self.build_peep_tags(results)
    peep_tags = []
    results.each do |result|
      peep_id = result['peep_id'].to_i
      tag_id = result['tag_id'].to_i

      peep_tag = PeepTag.new
      peep_tag.peep_id = peep_id
      peep_tag.tag_id = tag_id

      peep_tags << peep_tag
    end
    peep_tags
  end
  
end
