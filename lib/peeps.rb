require 'pg'

class Peeps

  def self.all
    connection = PG.connect(dbname: 'makers_peeps')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['message'] }
    
  end

end
