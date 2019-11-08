require 'pg'

class Peep

  attr_reader :id, :maker, :time, :message

  def initialize(id:, maker:, message:, time:)
    @id = id
    @maker = maker
    @time = time
    @message = message
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM bookmarks")
    result.map do |peep|
      Peep.new(id: peep['id'], maker: peep['maker'], time: peep['time'], message: peep['message'])
    end
  end

  def self.make_peep(maker:, message:, time:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (maker, message, time) VALUES('#{maker}', '#{message}', '#{time}') RETURNING id, maker, message, time;")
    Peep.new(id: result[0]['id'], maker: result[0]['maker'], message: result[0]['message'], time: result[0]['time'])
  end

end