require 'pg'
class Peep

  attr_reader :message
  @@messages = []

  def initialize(peep)
    @message = peep
  end

  def self.create(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_database_test')
    else
      connection = PG.connect(dbname: 'peeps_database')
    end

    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING peep;")
    Peep.new( result[0]['peep'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_database_test')
    else
      connection = PG.connect(dbname: 'peeps_database')
    end

    result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep|
      Peep.new(peep['peep'])
    end
  end

end
