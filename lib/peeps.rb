class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter_development')
    end
    result = con.exec('SELECT * FROM peeps')
    result.map { |peep| peep['url']}

  end
end