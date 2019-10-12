require 'pg'
require 'pry'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peeps'], time: peep['created_at'])
    end # table is called peeps and column is called peeps
  end

  def self.create(peep:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}') RETURNING id, peeps, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peeps'], time: result[0]['created_at'])
  end

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end
end
