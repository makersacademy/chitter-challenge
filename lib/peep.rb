require 'pg'

class Peep
  attr_reader :body, :id

  def self.all
    database_selector
    result = @connection.exec('SELECT * FROM peep;')
    result.map { |peep| Peep.new(peep['id'],peep['body']) }
  end

  def self.add(body)
    database_selector
    @connection.exec("INSERT INTO peep (body) VALUES('#{body}')")
  end

  def self.delete(id)
    database_selector
    @connection.exec("DELETE FROM peep WHERE id = #{id}")
  end

  def self.edit(id,text)
    database_selector
    @connection.exec("UPDATE peep SET body = '#{text}' WHERE id = #{id}")
  end

  def initialize(id, body)
    @id = id
    @body = body
  end

  private
  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect( dbname: 'chitter' )
    end
  end

end
