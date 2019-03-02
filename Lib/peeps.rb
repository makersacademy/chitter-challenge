require 'pg'

class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_tester')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
      result = connection.exec("select * from peeps")
      result.map{|message| Peep.new(id: message['id'], peep: message['peep'])}
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_tester')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING peep;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end
