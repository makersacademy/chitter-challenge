require 'pg'

class Peep
  attr_reader :id, :time, :message

  def initialize(id:, time:, message:)
    @id = id
    @time = time
    @message = message
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], time: peep['time'], message: peep['message'])
    end
  end

  def self.create(message:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (time, message) VALUES(
      CURRENT_TIMESTAMP, '#{message}') RETURNING id, time, message;")
    Peep.new(id: result[0]['id'], time: result[0]['time'], message: result[0][
      'message'])
  end

end
