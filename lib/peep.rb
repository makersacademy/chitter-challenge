require './lib/database_connection'
require './setup_database_connection'

class Peep
  attr_reader :content, :posttime

  def initialize(id, content, posttime, tags)
    @id = id
    @content = content
    @posttime = posttime
    @tags = tags
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY posttime DESC')
    result.map do |peep|
      Peep.new(peep['id'], peep['content'], peep['posttime'], peep['author_id'])
    end
  end

  def self.create_peep(content, author_id)
    DatabaseConnection.query("INSERT INTO peeps (content, author_id) VALUES ('#{content}', '#{author_id}')")
  end

end
