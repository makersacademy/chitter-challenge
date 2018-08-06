require 'pg'
class Peep

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    result = connection.exec('SELECT * FROM makers')
    result.map { |message| message['date'] + " at " + message['time'] + " : " +
      message['name'] + " - " + message['message']
    }
  end

  def self.add(username, peep)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec("INSERT INTO makers (message, name, date, time) VALUES
    ('#{peep}', '#{username}', '#{Time.new.strftime("%m/%d/%Y")}',
    '#{Time.new.strftime("%I:%M%p")}') ")
  end

end
