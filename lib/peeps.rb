require 'pg'

class Peep 
  def self.all
    connection = pg_connection
    result = connection.exec_params("SELECT * FROM peeps INNER JOIN users ON users.id = peeps.user_id ORDER BY time DESC;")
  end

  def self.create(peep_text:, user_id:)
    connection = pg_connection
    current_time = DateTime.now
    time = current_time.strftime "%Y-%m-%d %H:%M:%S"
    connection.exec_params("INSERT INTO peeps (peep_text, time, user_id) VALUES('#{peep_text}', '#{time}', '#{user_id}');")
  end
  
  
  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end
end