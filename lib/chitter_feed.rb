require 'pg'

class ChitterFeed
  def self.content
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT content FROM feed;')
    result.map { |item| item['content'] }
  end

end
