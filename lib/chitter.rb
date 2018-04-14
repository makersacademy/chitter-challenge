require 'pg'

ENV["DB"] = "chitter"

class Chitter

  def self.all
    con = PG.connect :dbname => ENV["DB"]
    result = con.exec "SELECT * FROM chitters"
    result.map {|post| [post['name'], post['peep'], post['timestamp']]}
  end

  def self.create(params)
    con = PG.connect :dbname => ENV["DB"]
    time = (Time.now + (60*60)).strftime("%H:%M")
    con.exec_params "INSERT INTO CHITTERS(name, peep, timestamp) VALUES($1, $2, $3)", [params[:name], params[:peep], "#{time}"]
  end

end
