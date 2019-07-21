require 'pg'
require 'date'

class Message

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM messages")
    result.map do |peep|
      Message.new(id: peep['id'], peep: peep['peeps'], time: DateTime.parse(peep['time']).strftime("%e %b %Y %H:%M:%S%p"))
    end
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO messages (peeps, time) VALUES('#{message}', '#{Time.now}') RETURNING id, peeps, time;")
    Message.new(id: result[0]['id'], peep: result[0]['peeps'], time: result[0]['time'])
  end
end
