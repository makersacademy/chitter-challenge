require 'pg'
require_relative './database_connection'

class Peeps

  attr_reader :id, :message, :time, :name

  def initialize(id:, message_content:, timestamp_utc:, name:)
    @id = id
    @message_content = message_content
    @timestsamp_utc = timestamp_utc
    @name = name
  end

  def self.all
    
      result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY timestamp_utc DESC;')
      result.map { | peep | 
        Peeps.new(id: peep['id'], message_content: peep['message_content'], timestamp_utc: peep['timestamp_utc'], name: peep['name'])
      }
  end

  def self.create(message_content:, name:)
    peep = message_content.gsub("'", "''")
    result = DatabaseConnection.query("INSERT INTO peeps (message_content, name) VALUES('#{message_content}', '#{name}') RETURNING id, message_content, timestamp_utc, name;")
    Peeps.new(id: result[0]['id'], message_content: result[0]['message_content'], timestamp_utc: result[0]['timestamp_utc'], name: result[0]['name'])
  end

end