require 'date'
require 'pg'
require 'time'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |title| "#{title['peep']} by @#{title['username']} at #{title['time']} on #{title['date']}" }
  end

  def self.create(entry, user)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.now
    date = DateTime.now #.strftime("%d/%m/%Y")
    connection.exec("INSERT INTO peeps (peep, username, date, time) VALUES('#{entry}', '#{user}', '#{date}', '#{time}')")
  end
end
