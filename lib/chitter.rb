require 'pg'

ENV["DB"] = "chitter"

class Chitter

  def self.all
    con = PG.connect :dbname => ENV["DB"]
    result = con.exec "SELECT * FROM chitters"
    result.map {|post| [post['name'], post['peep']]}
  end

  def self.create(params)
    con = PG.connect :dbname => ENV["DB"]
    con.exec_params "INSERT INTO CHITTERS(name, peep) VALUES($1, $2)", [params[:name], params[:peep]]
  end

end
