require 'pg'
require 'database_connection'

class Peeps

  attr_reader :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps')

    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.add(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep, time) 
    VALUES('#{peep}', '#{Time.now}') RETURNING id, peep, time;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'], 
      time: result[0]['time'])
  end

end
