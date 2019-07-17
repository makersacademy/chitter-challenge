require 'pg'
 # when you create a new instance of an object, you can add time stamp with time.now
 # or such. then yu add time stamp to database. set it as attribute?
class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end

end
