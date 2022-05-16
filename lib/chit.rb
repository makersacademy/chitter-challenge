require 'pg'

class Chit

attr_reader :content, :handle, :timestamp

  def initialize(content:, handle:, timestamp: Time.new.strftime("%H:%M:%S %d-%m-%Y"))
    @content = content
    @handle = handle
    @timestamp = timestamp
    #I don't know why, but while I can initialize content and handle as keywords(?) without giving them a value, timestamp throws a strop
    #if I don't assign it a value here. Which then overrides any assignment that might take place in 'result'. Which means that with this
    #method I can't display the time of posting, just the time the page was loaded, which is pretty useless.
    #if there were a way to initialize timestamp in the same way as the other two, I'd be fine. Can't understand what the difference is,
    #except that content and handle are assigned values in params in the controller, whereas timestamp first comes into existence here...
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
      Chit.new(content: chit['content'], handle: chit['handle'], timestamp: result[0]['timestamp'])
    end
  end

  def self.post(handle:, content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec_params("INSERT INTO chits (handle, content) VALUES ($1, $2) RETURNING handle, content;", [handle, content])
      Chit.new(content: result[0]['content'], handle: result[0]['handle'], timestamp: result[0]['timestamp'])
  end
end
