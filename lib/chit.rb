require 'pg'

class Chit

attr_reader :content, :handle, :timestamp

  def initialize(content:, handle:, timestamp:)
    @content = content
    @handle = handle
    @timestamp = timestamp
  end


  def self.all
    # research self
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chits')
    result.map do |chit|
      Chit.new(content: chit['content'], handle: chit['handle'], timestamp: chit['timestamp'])
    end
  end

  def self.post(handle:, content:)
    date_time = DateTime.now
    timestamp = date_time.strftime "%Y-%m-%d %H:%M"
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      connection.exec_params("INSERT INTO chits (handle, content, timestamp) VALUES ($1, $2, $3) RETURNING handle, content, timestamp;", [handle, content, timestamp])
  end
end
