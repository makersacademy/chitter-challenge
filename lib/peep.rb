require './lib/database_connection'
require './setup_database_connection'

class Peep
  attr_reader :content
  
  def initialize(id, content, timestamp, tags)
    @id = id
    @content = content
    @timestamp = timestamp
    @tags = tags
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(peep['id'], peep['content'], peep['timestamp'], peep['author_id'])
    end
  end

  def self.create_peep(content, author_id)
    DatabaseConnection.query("INSERT INTO peeps (content, author_id) VALUES ('#{content}', '#{author_id}')")
  end

end
