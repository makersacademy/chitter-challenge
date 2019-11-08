require 'pg'


class Peeps

  attr_reader :id, :time, :peep

  def initialize(id:, time:, peep:)
    @id = id
    @time = time
    @peep = peep
  end

  def self.add(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep, time")
    Peeps.new(id: result[0]['id'], time: result[0]['time'], peep: result[0]['peep'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC')
    result.map do |peeps|
      Peeps.new(id: peeps['id'], time: peeps['time'], peep: peeps['peep'])
    end
  end
end
