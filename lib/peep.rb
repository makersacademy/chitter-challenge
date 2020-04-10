require 'pg'

class Peep

  def self.create(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec "INSERT INTO peeps(peep, peeper) VALUES('#{peep}', 'none')"
  end

end