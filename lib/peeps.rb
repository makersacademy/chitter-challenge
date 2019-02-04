require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peep_manager.rb'
require 'pg'
require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/app.rb'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |chitter| chitter['peeps'] }
  end

  # def self.create(peep:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter')
  #   end
  #     connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  # end

  attr_reader :id, :peep, :time, :date

  def initialize(id:, peep:, date:, time:)
    @id = id
    @peeps = peep
    @date = date
    @time = time
  end

def self.add(peep:)
 if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
 else
      connection = PG.connect(dbname: 'chitter')
 end

 result = connection.exec("INSERT INTO peeps (peeps, date, time) VALUES('#{peep}', '#{DateTime.now.strftime("%d/%m/%Y")}', '#{DateTime.now.strftime("%I:%M%p")}') RETURNING id, peeps, date, time;")
 Peep.new(id: result.first['id'], peep: result.first['peeps'], date: result.first['date'], time: result.first['time'])
end



end
