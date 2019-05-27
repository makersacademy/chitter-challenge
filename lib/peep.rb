require 'pg'
require 'timecop'

class Peep

  attr_reader :id, :peep, :timestamp
  
  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    time = Time.now.strftime("%Y-%m-%d %H:%M")
    formatted_peep = peep.gsub(/'/, "''")

    result = connection.query("INSERT INTO peeps (peep, timestamp) VALUES('#{formatted_peep}', '#{time}') RETURNING id, peep, timestamp;")
    Peep.new(id: result[0]["id"], peep: result[0]["peep"], timestamp: result[0]['timestamp'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(id: peep["id"], peep: peep["peep"], timestamp: peep['timestamp'])
    end
  end

  private



end