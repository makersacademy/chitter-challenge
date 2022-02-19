require 'pg'
class Chitterpeep

   
  def self.add_peep(peep)
    conn = PG.connect(dbname: 'chitter')
    conn.exec("INSERT INTO chitter_peeps (peep) VALUES('#{peep}')")
    # result = conn.exec('SELECT * FROM chitter_peeps')
    # result.map { |peeps| peeps['peep']}
  end

  def self.view_peep
    conn = PG.connect(dbname: 'chitter')
    result = conn.exec('SELECT * FROM chitter_peeps ORDER BY id DESC')
    result.map { |peeps| peeps['peep']}
  end
end