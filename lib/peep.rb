require_relative 'database_connection'

class Peep
  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")

    rs.map { |peep| peep['content'] }
  end

  def self.create(content:)
    rs = DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('#{content}');")
  end
end