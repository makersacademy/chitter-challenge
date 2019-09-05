require 'pg'

class Peep
  attr_reader :id,:peeps,:timestamp

  def initialize(id:,peeps:,timestamp:)
    @id = id
    @peeps = peeps
    @timestamp = timestamp
  end
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map {|peep| message = [peep['peeps'],peep['timestamp']]}
  end

  def self.create(peeps:,timestamp:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("INSERT INTO peeps (peeps, timestamp) VALUES ('#{peeps.gsub(/'/,"''")}','#{timestamp}') RETURNING id,peeps,timestamp;")
      Peep.new(id:result[0]['id'], peeps:result[0]['peeps'], timestamp:result[0]['timestamp'])
  end
end
