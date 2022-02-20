require 'pg'

class Peep

  attr_reader :message, :time

  def initialize(message:, time:)
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
      Peep.new(message: peep['message'], time: peep['time'])
    end
  end

  def self.write(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{text}') RETURNING message, time")
  end

end
