require 'pg'

class Peep

  attr_reader :id, :username, :peep, :chittered_on

  def initialize(id:, username:, peep:, chittered_on:)
    @id = id
    @username = username
    @peep = peep
    @chittered_on = chittered_on
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], 
        peep: peep['peep'], chittered_on: peep['chittered_on'])
    end
  end

  def self.create(username:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec(
      "INSERT INTO peeps (username, peep, chittered_on) 
      VALUES('#{username}', '#{peep}', '#{chittered_on}');"
    ) 
    Peep.new(username: result[0]['username'], 
      peep: result[0]['peep'], chittered_on: result[0]['chittered_on'])
  end
end
