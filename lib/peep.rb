class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("SELECT * FROM posts ORDER BY time DESC;")
    result.map { |post| post['post'] }
  end
  
  def self.time
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("SELECT * FROM posts ORDER BY time DESC;")
    result.map { |post| post['time'] }
  end
end
