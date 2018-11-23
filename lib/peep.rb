require 'pg'

class Peep
  attr_reader :peep_id, :content, :timestamp

  def initialize(peep_id, content, timestamp)
    @peep_id = peep_id
    @content = content
    @timestamp = timestamp
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY timestamp;")
    result.map { |peep|
      Peep.new(peep['peep_id'], peep['content'], peep['timestamp'])
    }
  end

  def self.add(content, timestamp = Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (content, timestamp) VALUES ('#{content}', '#{timestamp}');") # Add in returning?
  end
end
