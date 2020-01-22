require 'pg'

class Peeps

  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'chitterbase_test')
    else
      connection = PG.connect(dbname: 'chitterbase')
    end
      result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
      result.map do |peeps|
      Peeps.new(id: peeps['id'], peep: peeps['peep'], timestamp: peeps['timestamp'])
    end
  end


  def self.create(peep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitterbase_test')
  else
    connection = PG.connect(dbname: 'chitterbase')
  end

  connection.exec("INSERT INTO peeps (peep, timestamp) VALUES('#{peep}', NOW()) RETURNING peep, timestamp, id")
  end

end
