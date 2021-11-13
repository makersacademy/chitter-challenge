require 'pg'
require 'chitter'

class Chitter

  def self.all

    connection = PG.connect(dbname: 'chitter')
    result = connect.exec('SELECT * FROM chitter')
    result.map { |chitter| [chitter['name'],chitter['chit']] }
  end
  
  def self.add(_chitter_name, _chitter_chit)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter (name, chit) VALUES("#{chitter_name}","#{chitter_chit}");)
  end
  
end
