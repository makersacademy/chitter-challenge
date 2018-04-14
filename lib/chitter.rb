require 'pg'

ENV["DB"] = "chitter"

class Chitter

  def self.all
    con = PG.connect :dbname => ENV["DB"]
    result = con.exec "SELECT * FROM chitters"
    result.map {|peeps| [peeps['name'], peeps['peep']]}
  end

  def self.create(hash)
    con = PG.connect :dbname => ENV["DB"]
    con.exec_params "INSERT INTO chitters(name,peep) VALUES($1, $2)", [hash[:name], hash[:peep]]
  end

end
