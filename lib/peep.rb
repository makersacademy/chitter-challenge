require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    connection.exec("SELECT * FROM peeps")
  end

def self.create(params)
  connection = PG.connect(dbname: 'chitter')
  connection.exec("INSERT INTO peeps (peeps) VALUES('#{params['message']}');")
end
end
