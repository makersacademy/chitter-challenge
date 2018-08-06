require 'date'
require 'time'
require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'chitter_challenge')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    end
    result = connection.exec("TABLE peeps")
    result.map { |peep| { :username => peep['username'], :peep => peep['peep'], :date => peep['date'], :time => peep['time']  } }
  end

  def self.add(username, peep)
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'chitter_challenge')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    end
    connection.exec "INSERT INTO peeps (username, peep, date, time) VALUES ('#{username}', '#{peep}', '#{Time.now.strftime('%Y-%m-%d')}', '#{Time.now.strftime('%H:%M:%S')}')"
  end

end
