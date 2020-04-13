require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'posted_peeps_test')
    else
      connection = PG.connect(dbname: 'posted_peeps')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['peep'] }
  end

  def self.post(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'posted_peeps_test')
    else
      connection = PG.connect(dbname: 'posted_peeps')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES ('#{text}') RETURNING peep")
  end

end