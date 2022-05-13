require 'pg'

class Peep 
  def self.all
    connection = pg_connection
    result = connection.exec_params("SELECT * FROM peeps ORDER BY time DESC;")
  end

  def self.create(peep_text:)
    connection = pg_connection
    current_time = DateTime.now
    time = current_time.strftime "%Y-%m-%d %H:%M:%S"
    connection.exec_params("INSERT INTO peeps (peep_text, time) VALUES('#{peep_text}', '#{time}');")
  end
  
  
  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end
end