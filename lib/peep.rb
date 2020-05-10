require 'pg'

class Peep

  attr_reader :id, :peep, :time, :name, :username

  def initialize(id:, peep:, time:, name:, username:)
    @id = id
    @peep = peep
    @time = time
    @name = name
    @username = username
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['ts'], name: peep['name'], username: peep['username'])
    end
  end

  def self.add(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, ts, name, username;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['ts'], name: result[0]['name'], username: result[0]['username'])
  end
end
