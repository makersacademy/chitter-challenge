require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec_params("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], peep: peep['peep'])
    end
  end 

  def self.add(name:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec_params(
      "INSERT INTO peeps (name, peep) VALUES('#{name}', '#{peep}') RETURNING id, name, peep;")
    Peep.new(id: result[0]['id'], name: result[0]['name'], peep: result[0]['peep'])
  end 

  attr_reader :id, :name, :peep

  def initialize(id:, name:, peep:)
    @id = id
    @name = name
    @peep = peep
  end

end 
