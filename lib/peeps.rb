require 'pg'

class Peep

  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message")
    p Peep.new(message: result[0]['message'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT message FROM peeps")
    result.map do |peep|
    Peep.new(message: peep['message'])
    end
  end
end
