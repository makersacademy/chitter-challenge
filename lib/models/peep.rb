require_relative '../database_connection'
class Peep
  attr_accessor :content, :id
  def initialize(content: content)
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |record| Peep.new(content: record['content']) }
  end

  def self.create(content: content)
    DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('#{content}');")
  end

  def self.find(id: id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    result.map { |record| Peep.new(content: record['content']) }.first
  end

  def self.update(id: id, content: content)
    DatabaseConnection.query("UPDATE peeps SET content = '#{content}' WHERE id = #{id};")
  end

  def self.delete(id: id)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id};")
  end
end
