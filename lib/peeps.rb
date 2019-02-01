require 'pg'

class Peeps



private

  def self.database_connection
    if TEST['ENVIRONMENT'] == 'test'
      @connection = PG.connect( dbname: 'chitter_test')
    else
      @conenction = PG.connect( dbname: 'chitter')
    end
  end

end
