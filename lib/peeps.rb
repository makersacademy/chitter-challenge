require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peep_manager.rb'
require 'pg'

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
end
