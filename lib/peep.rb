require 'pg'

class Peep

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time[11..15]
    @date = time[8..9] + "-" + time[5..6] + "-" + time[2..3]
  end

  attr_reader :id, :peep, :time, :date

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("SELECT * FROM peeps").map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
    peeps.reverse
  end

  def self.post(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec(
      "INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep, time;"
    )
    Peep.new(id: peeps[0]['id'], peep: peeps[0]['peep'], time: peeps[0]['time'])
  end

end
