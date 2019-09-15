require 'pg'

class Peep
  def self.all
    conn = PG::connect(dbname: 'chitter')
    result = conn.exec('SELECT * FROM peeps ORDER BY id DESC')
    result.map do |row|
      row['peep']
    end
  end
end
