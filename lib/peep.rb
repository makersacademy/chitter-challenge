class Peep

  attr_reader :username, :message

  def initialize(username, message)
    @username = username
    @message = message
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map { |peep| Peep.new(peep['username'], peep['message']) }
  end

end
