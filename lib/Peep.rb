require 'pg'

class Peep

  def initialize
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM all_peeps ORDER BY time desc;")
    result.map {|peep| peep['peep_text']}
  end

  def self.create(peep_text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO all_peeps (peep_text) VALUES('#{peep_text}')")
  end

end
