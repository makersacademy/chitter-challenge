require 'pg'

class Peep 
  def self.all
    connection = pg_connection
    result = connection.exec_params("SELECT * FROM peeps INNER JOIN users ON users.id = peeps.user_id ORDER BY time DESC;")
    connection.close
    return result
  end

  def self.create(peep_text:, user_id:)
    connection = pg_connection
    current_time = DateTime.now
    time = current_time.strftime "%Y-%m-%d %H:%M:%S"
    connection.exec_params("INSERT INTO peeps (peep_text, time, user_id) VALUES('#{peep_text}', '#{time}', '#{user_id}');")
    connection.close
  end
  
  
  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect("postgres://bkhzeojfcrccvf:48beeb924bf7e4cb7592f9915c6c475d0a09df705b135eb4652dbd4c8c051462@ec2-52-212-228-71.eu-west-1.compute.amazonaws.com:5432/d4i40hd290ll7e")
    end
  end
end