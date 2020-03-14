class Peep
  require 'pg'

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['message'] }
  end

end
