require 'PG'

class Chitter
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM chitter_db;")
    peeps = result.map { |post| post['peep'] }.reverse()
    peeps.join("<br><br>")
  end

  def self.add(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO chitter_db (peep,time,date) 
      VALUES ('#{peep}','#{Time.now}','#{Date.today}');")
  end

  def self.remove(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("DELETE FROM chitter_db WHERE id = '#{id}';")
  end

end
