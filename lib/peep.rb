require 'pg'

class Peep
  attr_reader :id, :peep, :date

  def initialize(id:, peep:, date:)
    @id = id
    @peep = peep
    @date = date
  end

  def self.create(peep:)
    connection = self.connect
    result = connection.exec_params("INSERT INTO peeps (peep, date) VALUES ($1, now()) RETURNING id, peep, date;", [ peep ])
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], date: result[0]['date'])
  end

  def self.all
    connection = self.connect
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], date: peep['date'])
    end
  end

  private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    return connection
  end
end
