class Peep
  attr_reader :message

  def initialize(message)
    @message = message
  end

  class << self
    def create(message)
      sql = "INSERT INTO peep (message) VALUES ('#{message}');"
      DatabaseConnection.query(sql)
    end

    def list
      results = DatabaseConnection.query('SELECT * FROM peep;')
      results.map { |peep| Peep.new(peep['message']) }
    end
  end
end
