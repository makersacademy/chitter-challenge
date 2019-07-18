require 'pg'
require_relative './database_connection'

class Peep

  attr_reader :time, :peep

  def initialize(peep = nil, time = nil)
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else 
     connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(peep['peep'], peep['time']) }
  end

  def self.add(peep, time = Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else 
     connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{time}') RETURNING peep, time;")
    Peep.new(result[0]['peep'], result[0]['time'])
    # RETURNING id, title, url
  end

# if ENV['ENVIRONMENT'] == 'test'
# connection = PG.connect(dbname: 'peep_manager_test')
# else 
# connection = PG.connect(dbname: 'peep_manager')
# end

end
