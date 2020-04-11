require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_peeps')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| "User: #{peeps['username']} Peep: #{peeps['peep']} Time: #{peeps['time']}"
}


  end

  def peep_time
    Time.now
  end
end
