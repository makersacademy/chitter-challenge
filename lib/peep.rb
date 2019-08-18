class Peep
  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    peeps = result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        timestamp: peep['timestamp']
      )
    end
    peeps.sort_by { |peep| -peep.id.to_i }
  end


  attr_reader :id, :message, :timestamp

  def initialize(id:, message:, timestamp:)
    @id = id
    @message = message
    @timestamp = timestamp
  end
end