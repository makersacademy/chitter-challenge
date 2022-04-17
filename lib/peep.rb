class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PGConn.open(dbname: 'chitter_test')
    else
      onnection = PGConn.open(dbname: 'chitter')
    end
  
    result = connection.exec("SELECT * FROM chitter")
    result.map { |chitter| chitter['title'] }
  end
end
  