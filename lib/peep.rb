require 'pg'
require 'database_connection'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps1")
    result.map do |peep|
    Peep.new(peep: peep['peep'], id: peep['id'], time: peep['time'])
    end
  end

  def self.create(peep:,time:)
    result = DatabaseConnection.query("INSERT INTO peeps1 (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time")
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end
    # result = connection.exec("INSERT INTO peeps1 (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps1 WHERE id = #{id}")
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end
    # connection.exec("DELETE FROM peeps1 WHERE id = #{id};")
  end

  def self.update(id:, peep:, time:)
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end
    # result = connection.exec("UPDATE peeps1 SET peep = '#{peep}', time = '#{Time.now}' WHERE id = #{id} RETURNING id, peep, time;")
    result = DatabaseConnection.query("UPDATE peeps1 SET peep = '#{peep}', time = '#{Time.now}' WHERE id = #{id} RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.find(id:)
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connection(dbname: 'chitter')
    # end
    # result = connection.exec("SELECT * FROM peeps1 WHERE id = #{id};")
    result = DatabaseConnection.query("SELECT * FROM peeps1 WHERE id = #{id};")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

end
