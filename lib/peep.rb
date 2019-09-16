require 'pg'

class Peep
  attr_reader :id, :peep, :timestamp

  def initialize(id, peep, timestamp)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.all
    conn = connect
    result = conn.exec('SELECT * FROM peeps ORDER BY id DESC')
    result.map do |row|
      Peep.new(row['id'], row['peep'], row['timestamp'])
    end
  end

  def self.new_peep(peep)
    conn = connect
    result = conn.exec(
      "INSERT INTO peeps (peep, timestamp) VALUES('#{peep}',
      CURRENT_TIMESTAMP(0)) RETURNING id, peep, timestamp"
    )
    Peep.new(result[0]['id'], result[0]['peep'], result[0]['timestamp'])
  end

  private_class_method def self.connect
    return PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'

    PG.connect(dbname: 'chitter')
  end
end
