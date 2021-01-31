require 'pg'

class Peep

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end

  def self.create(content)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end
    connection.exec("INSERT INTO peeps(content) VALUES ('#{content}');")
  end


end
