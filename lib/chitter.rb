require 'pg'

class Chitter

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map {|peep| peep['peep']}
  end

  def self.create(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
      connection.exec("INSERT INTO peeps (peep, posted_at) VALUES('#{peep}','#{Time.now}')")
  # connection.exec("INSERT INTO peeps (time) VALUES('#{Time.now}')")
  end
end
