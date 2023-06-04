require_relative '../models/peep_tag'
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

  def self.find_peeps_with_tags
    query = <<~SQL
      SELECT p.id, p.content, p.timestamp, p.user_id, t.name
      FROM peeps p
      LEFT JOIN peep_tags pt ON p.id = pt.peep_id
      LEFT JOIN tags t ON pt.tag_id = t.id;
    SQL

    result = DatabaseConnection.exec(query)
    build_peeps_with_tags(result)
  end

  def self.find_by_user(user_id)
    query = <<~SQL
      SELECT pt.peep_id, pt.tag_id, t.name
      FROM peep_tags pt
      JOIN tags t ON pt.tag_id = t.id
      JOIN peeps p ON pt.peep_id = p.id
      WHERE p.user_id = $1;
    SQL
  
    result = DatabaseConnection.exec_params(query, [user_id])
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

  def self.build_peeps_with_tags(results)
    peeps = []
    results.each do |result|
      peep = Peep.new
      peep.id = result['id'].to_i
      peep.content = result['content']
      peep.timestamp = result['timestamp']
      peep.user_id = result['user_id'].to_i
      peep.author = UserRepository.find(peep.user_id)
      
      tag_name = result['name']
      unless tag_name.nil?
        tag = Tag.new
        tag.name = tag_name
        peep.tags << tag
      end
      
      peeps << peep
    end
    peeps
  end
  
end
