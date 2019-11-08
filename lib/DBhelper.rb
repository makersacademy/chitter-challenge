require 'pg'

class DBhelper

  def self.new_peep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO peeps (title, body, username, time) VALUES ('#{peep.title}','#{peep.body}', 'testusername', '#{peep.time}')")
  end

  def self.select
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("SELECT * FROM peeps")
  end

end