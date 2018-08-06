require 'pg'

class Peep
  def self.post(name, username, peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
      connection.exec("INSERT INTO peeps(name, username, peep) VALUES('#{name}', '#{username}', '#{peep}')")
  end

  def self.view_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("select * from peeps")
    result.map { |record| record['peep'] }
  end

end
