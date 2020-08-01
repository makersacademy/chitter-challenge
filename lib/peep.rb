require 'pg'

class Peep

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}')
    RETURNING id, message, time;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end

  def self.test
    connection = PG.connect(dbname: 'chitter')
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map { |peep| peep['message'] }
  end
end
