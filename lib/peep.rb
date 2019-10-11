require 'pg'
require 'pry'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peeps'])
    end # table is called peeps and column is called peeps
  end

  def self.create(peep:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}') RETURNING id, peeps;")
    Peep.new(id: result[0]['id'], peep: result[0]['peeps'])
  end

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end
end
