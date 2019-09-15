require 'pg'

class Peep
  def self.all
    conn = self.connect
    result = conn.exec('SELECT * FROM peeps ORDER BY id DESC')
    result.map do |row|
      row['peep']
    end
  end

  def self.new_peep(peep)
    p peep
    conn = self.connect
    conn.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end

private_class_method

  def self.connect
    return PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter')
  end
end
