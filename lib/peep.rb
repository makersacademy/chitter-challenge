require 'pg'
require_relative './database_connection'

class Peep
  def self.add(content:)
    r = DatabaseConnection.query("INSERT INTO peeps (content)
      VALUES ('#{content}') RETURNING id, content, timestamp;")
    # Peep.new(id: r[0]['id'], content: r[0]['content'], timestamp: r[0]['timestamp'])
  end
end
