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
    # [
    # 'Test Peep', 
    # 'I am a test peep',
    # 'Me too'
    # ]
  end

end
