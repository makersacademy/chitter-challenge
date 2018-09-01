require 'pg'

class Peep

  def self.all
    result = connect.exec("SELECT * FROM chits;")
    result.map { |row| row['peep'] }
  end

  def self.create(peep, time = Time.now)
    connect.exec("INSERT INTO chits (peep, time) VALUES ('#{peep}', '#{time}');")
  end

  def self.reverse
    connect.exec("SELECT peep, time FROM chits ORDER BY time desc;")
  end

private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
