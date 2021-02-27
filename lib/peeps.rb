require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| "#{peep['peep']} #{peep['time']}"}
  end
  # result.map { |bookmark| "#{bookmark['title']}: #{bookmark['url']}"}


  def self.create(peep, time = Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end

    connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{time}')")
  end

end
