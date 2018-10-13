require 'pg'

class Peep
  attr_reader :messages, :time_of_creation

  def initialize(messages:, time_of_creation:)
    @messages = messages
    @time_of_creation = DateTime.parse(time_of_creation, '%Y-%m-%d %H:%M:%S')
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    result = connection.exec("INSERT INTO peeps (messages) VALUES ('#{message}') RETURNING messages, time_of_creation;")
    Peep.new(messages: result[0]['messages'], time_of_creation: result[0]['time_of_creation'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    rs = connection.exec('SELECT * FROM peeps')
    rs.map do |peep|
      Peep.new(messages: peep['messages'], time_of_creation: peep['time_of_creation'])
    end
  end

end
