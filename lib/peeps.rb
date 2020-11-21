require 'pg'

class Peeps
  attr_reader :id, :username, :peep, :lastmodified

  def initialize(id: , username: , peep: , lastmodified: ) 
    @id = id
    @username = username
    @peep = peep
    @lastmodified = lastmodified
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(id: peep['id'], username: peep['username'],peep: peep['peep'], lastmodified: peep['lastmodified'])
    end
  end

  def self.create(username: , peep: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (username, peep) VALUES('#{username}', '#{peep}')")
  end


end