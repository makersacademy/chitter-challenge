require 'pg'


class ChitterFeed 

def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_manager_test')
  else
    connection = PG.connect(dbname: 'chitter_manager')
  end
  result = connection.exec("SELECT * FROM chitter;")
  result.map { |input| input['message'] }
end

def self.post(peep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_manager_test')
  else
    connection = PG.connect(dbname: 'chitter_manager')
  end

  connection.exec("INSERT INTO chitter (message) VALUES('#{peep}')")

end 

end 
