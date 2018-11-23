require_relative '../database_connection'
class Peep
  attr_accessor :content
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
end
