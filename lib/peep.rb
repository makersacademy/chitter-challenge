require 'pg'
class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_app_test')
  else
    connection = PG.connect(dbname: 'chitter_app')
end
result = connection.exec("SELECT NOW() +1")
result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
result.map {|peep| peep['peep'] }

end
def self.new_peep(peep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_app_test')
  else
    connection = PG.connect(dbname: 'chitter_app')
  end
    connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}')")
end
end
