require './lib/database_connection'
require './setup_database_connection'

class Peep

  def initialize(id, content, timestamp, tags)
    @id = id
    @content = content
    @timestamp = timestamp
    @tags = tags
  end

  def self.all
    p "in .all #{DatabaseConnection.connection}"
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(peep['id'], peep['content'], peep['timestamp'], peep['tags'])
    end
  end

end
