require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    @peeps = connection.exec('SELECT * FROM peeps;')
    @peeps.map { |peep| "#{peep['peep']} -- #{peep['time']}" }
  end

  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    @time = Time.new.strftime("%H:%M")
    connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{@time}')")
  end

end
