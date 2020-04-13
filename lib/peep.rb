require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| "User: #{peeps['username']} Peep: #{peeps['peep']} Time: #{peeps['time']}" }
  end

  def peep_time
    Time.now
  end

  def self.create(username:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end
    connection.exec("INSERT INTO peeps (username, peep, time) VALUES ('#{username}', '#{peep}', '#{Time.now}');")
  end
end
