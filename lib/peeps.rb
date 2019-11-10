class Peep
  def self.all
    connection = PG.connect(dbname: 'peepmanager')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['text'] }
  end
end
