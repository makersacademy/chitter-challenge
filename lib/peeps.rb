require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peep_manager.rb'
require 'pg'
require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/app.rb'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM chitter;')
    peep.map { |chitter| chitter['peep'] }
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')

      connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    end
end

def self.add(peep:)
 result = DatabaseConnection.query("INSERT INTO peeps (peep, date, time) VALUES('#{peep}', '#{DateTime.now.strftime("%d/%m/%Y")}', '#{DateTime.now.strftime("%I:%M%p")}') RETURNING id, peep, date, time;")
 Peep.new(id: result.first['id'], peep: result.first['peep'], date: result.first['date'], time: result.first['time'])
end
end
