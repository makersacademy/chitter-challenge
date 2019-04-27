require 'pg'

class ChitterModel
  def self.all
    if ENV['ENVIRONMENT'] == 'test_database'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    results = connection.exec('SELECT * FROM peep_table;')
    results.map do |peep_message|
      peep_message['peep']
    end
  end

  def self.create(a_peep)
    if ENV['ENVIRONMENT'] == 'test_database'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    insert_into_table = connection.exec("INSERT INTO peep_table (peep) VALUES('#{a_peep}') ")
  end
end
