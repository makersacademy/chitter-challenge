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
end
