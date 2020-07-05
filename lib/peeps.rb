require 'pg'
class Peep

  attr_reader :id, :username, :peep

  def initialize(id:, username:, peep:)
    @id = id
    @username = username
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY peep DESC;")
    result.map do |peep|
    Peep.new(id: peep['id'], username: peep['username'], peep: peep['peep'])
    end
  end

  def self.create(username:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO peeps (username, peep) VALUES ('#{username}', '#{peep}') RETURNING id, username, peep;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], peep: result[0]['peep'])
  end
end
