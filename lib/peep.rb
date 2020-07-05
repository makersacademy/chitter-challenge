class Peep
  attr_reader :body

  def self.all
    database_selector
    result = @connection.exec('SELECT * FROM peep;')
    result.map { |peep| Peep.new(peep['body']) }
  end

  def self.add(body)
    database_selector
    @connection.exec("INSERT INTO peep (body) VALUES('#{body}')")
  end

  def initialize(body)
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
