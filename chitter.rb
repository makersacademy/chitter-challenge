require 'pg'

class Chitter

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
    connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec('SELECT * FROM chitter')
    result.map{ |p| p p['message']}
  end
  def self.peep(message)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
    connection = PG.connect(dbname: 'chitter_manager')
    end 
    result = connection.exec("INSERT INTO chitter (message) VALUES('#{message}');")
  end
end
