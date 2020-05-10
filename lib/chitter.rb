require 'pg'

class Chitter

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec('SELECT * FROM chatter ')
    peeps.map { |latest| latest['peep'] }
  end

  def self.add(peep)
    time = self.time
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO chatter (peep, timestamp) VALUES('#{peep}', '#{time}')
                    RETURNING id, peep, timestamp")
  end

  def self.time
    Time.now.strftime("%c")
  end

end
