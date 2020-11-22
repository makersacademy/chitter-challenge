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

  connection.exec("INSERT INTO peeps (script,created_on,created_at,account_id) VALUES ('#{script}','20201121','16:40',(SELECT account_id FROM accounts WHERE username='Guest'));")

end
end
