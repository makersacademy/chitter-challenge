require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    peep = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message")
    Peep.new(id: peep[0]['id'], message: peep[0]['message'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end
end
