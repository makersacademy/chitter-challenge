class Chitter
  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| peeps['comments'] }
  end
end
