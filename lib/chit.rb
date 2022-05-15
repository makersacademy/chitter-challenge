require 'pg'

class Chit

attr_reader :content, :handle, :timestamp #:timestamp #need to find out how to initialize time

  def initialize(content:, handle:)
    @content = content
    @handle = handle
    @timestamp = Time.new.strftime "%H:%M:%S %d-%m-%Y"
    # @timestamp = Time.new.strftime "%H:%M:%S %d-%m-%Y"
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
      Chit.new(content: chit['content'], handle: chit['handle'])
    end
  end

  def self.post(handle:, content:)
    timestamp = Time.new.strftime "%H:%M:%S %d-%m-%Y"
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      # result = connection.exec("INSERT INTO chits (handle, content, timestamp) VALUES ('#{handle}', '#{content}', '#{timestamp}');")
      result = connection.exec("INSERT INTO chits (handle, content, timestamp) VALUES ('#{handle}', '#{content}', '#{@timestamp}') RETURNING handle, content, timestamp;")
      Chit.new(content: result[0]['content'], handle: result[0]['handle'])
  end
end
