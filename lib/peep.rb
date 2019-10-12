require 'pg'
require 'pry'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      # table is called peeps and column is called peeps
      Peep.new(id: peep['id'], peep: peep['peeps'], time: peep['created_at'], person: peep['person'])
    end
  end

  def self.create(peep:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}') RETURNING id, peeps, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peeps'], time: result[0]['created_at'], person: peep['person'])
  end

  def self.signup(name:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("ALTER TABLE peeps ALTER COLUMN person SET DEFAULT '#{name}';")
  end

  attr_reader :id, :peep, :time, :person

  def initialize(id:, peep:, time:, person:)
    @id = id
    @peep = peep
    @time = time
    @person = person
  end
end
