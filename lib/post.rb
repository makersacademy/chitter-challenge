require 'pg'

class Post

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitters_test')
    else
      connection = PG.connect(dbname: 'chitters')
    end

    connection.exec("INSERT INTO chitters (chitter_text) VALUES('#{peep}')")
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitters_test')
    else
      connection = PG.connect(dbname: 'chitters')
    end
    result = connection.exec('SELECT * FROM chitters')
    result.map { |chitter| chitter['chitter_text'] }
  end
end