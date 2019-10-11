require 'pg'

class Chitter

  attr_reader :id, :time, :peep

  def initialize(id:, time:, peep:)
    @id = id
    @time = time
    @peep = peep
  end

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY time;")
    result.map { |peep|
    Chitter.new(id: peep['id'], time: peep['time'], peep: peep['peep'])
    }
  end

  def self.peep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now.strftime("%F %T")}', '#{peep}');")
  end

end
