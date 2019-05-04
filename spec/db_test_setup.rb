require 'pg'

class DataBaseTestSetup
  def self.truncating
    p 'Clearing test database table......'
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec('TRUNCATE peep_table')
    connection.exec('TRUNCATE users')
    p 'Done clearing test database table........'
  end

  def self.connection
    return PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test_database'

    PG.connect(dbname: 'chitter')
  end
end
