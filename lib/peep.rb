class Peep
  attr_reader :time, :message

  def initialize(time, message)
    @time = time
    @message = message
  end

  class << self
    def create(message)
      rows = 'time, message'
      values = "'#{time}','#{message}'"
      sql = "INSERT INTO peep (#{rows}) VALUES (#{values});"
      DatabaseConnection.query(sql)
    end

    def list
      results = DatabaseConnection.query('SELECT * FROM peep;')
      results.map { |peep| Peep.new(peep['time'], peep['message']) }
    end

    private

    def time
      time = Time.new
      "#{time.hour}:#{time.min}:#{time.sec}"
    end
  end
end
