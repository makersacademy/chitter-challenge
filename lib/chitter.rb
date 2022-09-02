require 'pg'

class Chitter

  attr_reader :id, :text, :timestamp

  def initialize(id:, text:, timestamp:)
    @id = id
    @text = text
    @timestamp = timestamp
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("SELECT * FROM peeps;")
    chrono_peeps = result.map do |peep|
      Chitter.new(id: peep['id'], text: peep['text'], timestamp: peep['timestamp'])
    end
    peeps = chrono_peeps.reverse
  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (text, timestamp) VALUES('#{text}', current_timestamp);")
  end
end