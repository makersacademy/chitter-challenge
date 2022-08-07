require 'pg'

class Chit

attr_reader :content, :handle, :timestamp

  def initialize(content:, handle:, timestamp:)
    @content = content
    @handle = handle
    @timestamp = timestamp
  end


  # def self.all
  #   # research self
  #   if ENV['ENVIRONMENT'] == "test"
  #     connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter')
  #   end
  #   result = connection.exec('SELECT * FROM chits')
  #   result.map do |chit|
  #     Chit.new(content: chit['content'], handle: chit['handle'], timestamp: chit['timestamp'])
  #   end
  # end
 
  def self.all
    connection = pg_connection
    result = connection.exec_params("SELECT * FROM chits")
    connection.close
    result.map do |chit|
      Chit.new(content: chit['content'], handle: chit['handle'], timestamp: chit['timestamp'])
    end
    # connection.close
  end

  def self.post(handle:, content:)
    date_time = DateTime.now
    timestamp = date_time.strftime "%Y-%m-%d %H:%M"
    connection = pg_connection
    connection.exec_params("INSERT INTO chits (handle, content, timestamp) VALUES ($1, $2, $3) RETURNING handle, content, timestamp;", [handle, content, timestamp])
    # connection.close
  end

  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect("postgres://tjcpisthcdezaj:e8888f176d8c4a9279a0c01b0ab685b3c51d82a97c406f0778ac35dccb85bfb1@ec2-3-213-228-206.compute-1.amazonaws.com:5432/db76t2s6m0vebl")
    end
  end
  
end
