require 'pg'
class Peep

  attr_reader :id, :peep_text, :time

  def initialize(id:, peep_text:, time:)
    @id  = id
    @peep_text = peep_text
    # to convert time string into time object
    @time = DateTime.parse(time, '%Y-%m-%d %H:%M:%S%z') 
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps_data order by time desc")
    # result.map { |peep| peep['peep'] }
    result.map do |peep|
      Peep.new(id: peep['id'], peep_text: peep['peep'], time: peep['time'])
    end
  end

  def self.create(peep:, time: DateTime.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps_data (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time")
    Peep.new(id: result[0]['id'], peep_text: result[0]['peep'], time: result[0]['time'])
  end
end