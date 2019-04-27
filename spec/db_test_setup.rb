require 'pg'

class DataBaseTespSetup
  def self.truncating
    p 'Clearing test database table......'
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec('TRUNCATE peep_table')
    p 'Done clearing test database table........'
  end
end
