require 'pg'

class Chitter

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.post(peep)
    database_connect
    result = @connection.exec_params("INSERT INTO peeps(peep) 
                                           VALUES($1) 
                                        RETURNING id, peep", [peep])
    Chitter.new(id: result[0]['id'], content: result[0]['peep'])
  end

  def self.list
    database_connect
    result = @connection.exec("SELECT * FROM peeps")
    result.map { |peep| Chitter.new(id: peep['id'], content: peep['peep']) }

  end

  private

  def self.database_connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else 
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end