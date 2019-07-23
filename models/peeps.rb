require 'pg'

class Peeps

  attr_reader :id, :peep, :time, :accounts

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.create(peep:, time:)
    result = connection.exec("INSERT INTO messages (peep, time) VALUES ('#{peep}', '#{time}') RETURNING id, peep, time;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.all
    result = connection.exec("SELECT * FROM messages;")
    result.map do |message|
      Peeps.new(id: message['id'], peep: message['peep'], time: message['time'])
    end
  end

end
