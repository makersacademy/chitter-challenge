require 'pg'

class Peep

  attr_reader :id, :username, :peep

  def initialize(id:, username:, peep:)
    @id  = id
    @username = username
    @peep = peep
  end

  @connection = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect dbname: 'chitter_test'
                else
                  PG.connect dbname: 'chitter_development'
                end

  def self.all
    result = @connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], peep: peep['peep'])
    end
  end

  def self.create(peep:, username:)
    result = @connection.exec("INSERT INTO peeps (username, peep) VALUES('#{username}', '#{peep}') RETURNING id, peep, username")
    Peep.new(id: result[0]['id'], username: result[0]['username'], peep: result[0]['peep'])
  end

  def self.delete(id:)
    @connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

end
