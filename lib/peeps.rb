require 'pg'

class Peeps

  def self.all
    connection = PG.connect(dbname: 'peeps')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['peep']}
  end

  def self.create

  end

end
