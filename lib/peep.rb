require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  
  end

  def self.create(name:, text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO peeps (name, text) VALUES('#{name}', '#{text}')") 
  end

end
