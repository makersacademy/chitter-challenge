require 'pg'
require 'date'
require_relative './peep'
require_relative './user'

class ChitterFeed

  def self.all
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    connection = PG.connect dbname: database
    result = connection.exec "SELECT peeps.id, content, timestamp,
                              name, username FROM peeps
                              INNER JOIN users
                              ON peeps.user_id = users.id
                              ORDER BY timestamp DESC;"
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'],
              timestamp: self.format_timestamp(peep['timestamp']), name: peep['name'],
              username: peep['username'])
    end
  end

  def self.format_timestamp(timestamp)
    DateTime.parse(timestamp).strftime('%a %d %b %H:%M')
  end

end
