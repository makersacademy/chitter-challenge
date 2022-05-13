require 'pg'

class Peep 
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    
  end

  def self.create(peep_text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    current_time = DateTime.now
    time = current_time.strftime "%Y-%m-%d %H:%M:%S"
    
    connection.exec("INSERT INTO peeps (peep_text, time) VALUES('#{peep_text}', '#{time}');")
  end
end
