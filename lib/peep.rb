require 'pg'

class Peep

  def self.all
    [
      'Peep #3',
      'Peep #2',
      'Peep #1',
      'Peep dis, yo!',
      'Peep dis!'
    ]
  end

  def self.create(text:)
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("insert into peeps (text) values ('#{text}');")
  end
  
end
