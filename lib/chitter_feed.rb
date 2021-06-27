require 'pg'

class ChitterFeed
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter_feed;")
    result.map { |peep| peep['peep']}
  end
end