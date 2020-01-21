require 'pg'

class Peep
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    peep = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, time_created")
    Peep.new(id: peep[0]['id'], message: peep[0]['message'], time: peep[0]['time_created'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time_created'])
    end
  end

  def self.all_reverse_chronological_order
    self.all.reverse
  end
end
