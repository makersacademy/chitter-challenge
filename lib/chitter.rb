require 'pg'
class Chitterpeep

   
  def self.add_peep(peep)
    conn = PG.connect(dbname: 'chitter')
    conn.exec("INSERT INTO chitter_peeps (peep) VALUES('#{peep}')")
    result = conn.exec('SELECT * FROM chitter_peeps')
    result.map { |peeps| peeps['peep']}
  end

  def self.view_peep
    ["My first Peep"]
  end
end