require 'pg'
class Peep

  attr_reader :id, :username, :peep, :time_created

  def initialize(id:, username:, peep:, time_created:)
    @id = id
    @username = username
    @peep = peep
    @time_created = time_created
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY peep DESC;")
    result.map do |peep|
    Peep.new(id: peep['id'], username: peep['username'], peep: peep['peep'], time_created: peep['time_created'])
    end
  end

  def self.create(username:, peep:, time_created:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO peeps (username, peep, time_created) VALUES ('#{username}', '#{peep}', '#{time_created}') RETURNING id, username, peep, time_created;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], peep: result[0]['peep'], time_created: result[0]['time_created'])
  end
end
