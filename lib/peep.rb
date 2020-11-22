require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['script'] }
  end

  def self.create(script:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    connection.exec("INSERT INTO peeps (script,account_id) VALUES ('#{script}',(SELECT account_id FROM accounts WHERE username='Guest'));")

  end
end
