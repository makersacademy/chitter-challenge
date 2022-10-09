require 'pg'

class Peep
  def self.all
    begin
      connection = PG.connect :dbname => 'chitter_test'
      result = connection.exec("SELECT * FROM peeps;")
      result.map do |row|
        p row
        new(id: row["id"],
            message: row["message"],
            username: row["username"],
            fullname: row["fullname"],
            timestamp: row["timestamp"])
      end
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end

  def self.create(message:, username:, fullname:, timestamp:)
    begin
      connection = PG.connect :dbname => 'chitter_test'
      connection.exec("INSERT INTO peeps (message, username, fullname, timestamp) VALUES('#{message}', '#{username}', '#{fullname}', '#{timestamp}')")
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end

  end

  attr_reader :id, :message, :username, :fullname, :timestamp
  def initialize(id:, message:, username:, fullname:, timestamp:)
    @id = id
    @message = message
    @username = username
    @fullname = fullname
    @timestamp = timestamp
  end
end