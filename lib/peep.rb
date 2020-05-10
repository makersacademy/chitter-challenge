require 'pg'

class Peep
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_Manager_test')
    else
      connection = PG.connect(dbname: 'Chitter_Manager')
    end
    result = connection.exec("SELECT * FROM peeps;").reverse_each
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.create(peep:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_Manager_test')
    else
      connection = PG.connect(dbname: 'Chitter_Manager')
    end
    result = connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end
end
