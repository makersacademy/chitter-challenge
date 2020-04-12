require 'pg'

class Messages
  def self.get_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test');
    else 
      connection = PG.connect(dbname: 'chitter');
    end 
      result = connection.exec('SELECT * FROM peeps')
      result.map { |row| row['message'] }
  end 
 
  def self.create(message:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'chitter_test');
    else 
      connection = PG.connect(dbname: 'chitter');
    end 
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}') ")

  end 
end