class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("SELECT * FROM posts")
    result.map { |post| post['post'] }
  end
end
