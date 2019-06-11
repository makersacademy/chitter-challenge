require 'pg'
class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec("SELECT * FROM peeps_table;")
    result.map { |message| "#{message['peep']} #{message['time']}"}
  end


  def self.post(message:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    connection.exec("INSERT INTO peeps_table (peep,time) VALUES ('#{message}','#{time}');")
  end
end
