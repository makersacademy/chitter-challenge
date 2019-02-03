require 'pg'

class Peep

  attr_reader :id, :username, :peep, :time

  def initialize(id:, peep:, username:, time:)
    @id = id
    @peep = peep
    @username = username
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    peeps = result.map do |peep|
      Peep.new(
        id: peep['id'],
        peep: peep['peep'],
        username: peep['username'],
        time: peep['time']
      )
    end
  end

  def self.create(peep:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.new.strftime('%F  %I:%M%p')
    result = connection.exec("INSERT INTO peeps (peep, username, time) VALUES ('#{peep}', '#{username}', '#{time}') RETURNING id, peep, username, time; ")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], username: result[0]['username'], time: result[0]['time'])
  end

end
