require 'pg'

class Peep
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{Time.now}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end
end
