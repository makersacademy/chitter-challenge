require 'pg'

class Peep

  attr_reader :id, :peep, :peep_created, :created_time

  def initialize(id:, peep:, peep_created:, created_time:)
    @id = id
    @peep = peep
    @peep_created = peep_created
    @created_time = created_time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT id, peep, peep_created, TO_CHAR(peep_created, 'DD-MON-YYYY HH12:MIPM') created_time FROM peeps ORDER by peep_created DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], peep_created: peep['peep_created'], created_time: peep['created_time'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
  result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, peep_created, created_time;").first
  Peep.new(id: result['id'], peep: result['peep'], peep_created: result['peep_created'], created_time: result['created_time'])
  end
end