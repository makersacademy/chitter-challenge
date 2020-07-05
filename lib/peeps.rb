require 'pg'
class Peep

  attr_reader :id, :username, :peep, :created_at

  def initialize(id:, username:, peep:, created_at:)
    @id = id
    @username = username
    @peep = peep
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY peep DESC;")
    result.map do |peep|
    Peep.new(id: peep['id'], username: peep['username'], peep: peep['peep'], created_at: peep['created_at'])
    end
  end

  def self.create(username:, peep:, created_at:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO peeps (username, peep, created_at) VALUES ('#{username}', '#{peep}', '#{created_at}') RETURNING id, username, peep, created_at;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end
end
