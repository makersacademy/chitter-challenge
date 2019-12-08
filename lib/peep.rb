require 'pg'
class Peep

  attr_reader :id, :message, :handle

  def initialize(id:, message:, handle:, time:)
    @id = id
    @message = message
    @handle = handle
    @time = Time.now
  end

  def self.post(message:, handle:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec "INSERT INTO peeps (message, handle) VALUES ('#{message}','#{handle}') RETURNING id, message, handle, time"
     Peep.new(id: result[0]['id'], message: result[0]['message'], handle: result[0]['@me'], time: result[0][Time.now])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], handle: peep['handle'], time: peep['time'])
    end
  end

  private

  def self.connect
    dbname = ENV['RACK_ENV'] == "test" ? 'chitter_test' : 'chitter'
    PG.connect dbname: dbname, user: ENV['USER']
  end

end
