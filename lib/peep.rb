require 'pg'

class Peep

  def self.store(peep, username)
    self.connect_db
    @con.exec "INSERT INTO peeps (peep, time, userid) VALUES ('#{peep}', CURRENT_TIMESTAMP, (SELECT userid from users WHERE username='#{username}'))"
  end

  def self.all
    self.connect_db
    result = @con.exec "SELECT peeps.peep, TO_CHAR(peeps.time, 'DD-MON-YYYY HH24:MI'), users.username FROM peeps INNER JOIN users ON peeps.userid = users.userid ORDER BY time DESC"
    result.map { |row| {:peep => row['peep'], :time => row['to_char'], :username => row['username']} }
  end

  private

  def self.connect_db
    database = ENV['ENVIRONMENT'] == 'test' ? 'peeps_manager_test' : 'peeps_manager'
    @con = PG.connect :dbname => database , :user => 'chloemingay'
  end


end
