require 'pg'

class Peep

  attr_reader :id, :peep, :peep_created

  def initialize(id:, peep:, peep_created:)
    @id = id
    @peep = peep
    @peep_created = peep_created[0...-10]
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT * FROM peeps ORDER by peep_created DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], peep_created: peep['peep_created'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
  result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, peep_created;").first
  Peep.new(id: result['id'], peep: result['peep'], peep_created: result['peep_created'])
  end
end