require 'pg'

class Peeps

  attr_reader :text, :time

  def initialize(text, time)
    @text = text
    @time = time
  end

  def self.all
    database_connection
    all_peeps = @connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    all_peeps.map { |text| Peeps.new(text["peep"], text["time"]) }
  end

  def self.post(text)
    database_connection
    @connection.exec("INSERT INTO peeps (peep, time) VALUES ('#{text}', 'NOW');")
  end

private

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
