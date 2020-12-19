require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message: )
    @id = id
    @message = message
  end

  def self.create(message: )
    result = db_connection.exec ("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message;")
    Peep.new(id: result.first['id'], message: result.first['message'])
  end

  def self.find(id: )
    result = db_connection.exec ("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(id: result.first['id'], message: result.first['message'])
  end

  def self.db_connection
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
  end

end
