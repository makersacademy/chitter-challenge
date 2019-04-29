require 'pg'

class Peep

  def self.all
      connection = if ENV['ENVIRONMENT'] == 'test'
                     PG.connect(dbname: 'chitter_challenge_test')
                   else
                     PG.connect(dbname: 'chitter_challenge')
                   end
      result = connection.exec('SELECT * FROM peeps;')
      result.map { |peep| peep['peep_content'] }
    end

  def self.compose(peep_content:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_challenge_test')
                 else
                   PG.connect(dbname: 'chitter_challenge')
                 end
    connection.exec("INSERT INTO peeps (peep_content) VALUES ('#{peep_content}');")
  end
  end
