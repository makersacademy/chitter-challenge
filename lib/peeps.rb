require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_peeps_test')
    else
      connection = PG.connect(dbname: 'makers_peeps')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['message'] }
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_peeps_test')
    else
      connection = PG.connect(dbname: 'makers_peeps')
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, timestamp")
    # result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, timestamp")
    # Peeps.new(id: result[0]['id'], message: result[0]['message'], timestamp: result[0]['timestamp'])
  end

end
