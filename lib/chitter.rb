require 'pg'
class Chitterpeep
   
   
  def self.add_peep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    conn.exec("INSERT INTO chitter_peeps (peep) VALUES('#{peep}')")
  end

  def self.view_peep
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec('SELECT * FROM chitter_peeps ORDER BY id DESC')
    result.map { |peeps| peeps['peep']}
  end
end