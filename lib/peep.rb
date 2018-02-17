class Peep

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map { |peep| Peep.new(peep['message']) }
  end

end
