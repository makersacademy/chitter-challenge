class Peep

  attr_reader :id, :message, :time_last_altered

  def initialize(id:, message:, time_last_altered:)
    @id = id
    @message = message
    @time_last_altered = time_last_altered
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time_last_altered: peep['time_last_altered'])
    end
  end

  def self.create(message:, time_last_altered: Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (message, time_last_altered) VALUES('#{message}', '#{time_last_altered}') RETURNING id, message")
    Peep.new(id: result[0]['id'], message: result[0]['message'], time_last_altered: result[0]['time_last_altered'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}'")
  end

end
