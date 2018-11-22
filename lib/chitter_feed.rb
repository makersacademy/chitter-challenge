require 'pg'
require_relative './peep'

class ChitterFeed

  def self.all
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    connection = PG.connect dbname: database
    result = connection.exec "SELECT * FROM peeps ORDER BY timestamp DESC;"
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'],
               content: peep['content'], timestamp: peep['timestamp'])
    end
  end

end
