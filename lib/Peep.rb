require 'pg'

class Peep
  attr_reader :id, :peep_text, :time

  def initialize(id:, peep_text:, time:)
    @id = id
    @peep_text = peep_text
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM all_peeps ORDER BY time desc;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep_text: peep['peep_text'], time: peep['time'])
    end
  end

  def self.create(peep_text:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO all_peeps (peep_text, time) VALUES('#{peep_text}', 'NOW') RETURNING id, peep_text, time;")
      Peep.new(id: result[0]['id'], peep_text: result[0]['peep_text'], time: result[0]['time'])
  end

end
