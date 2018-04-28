require_relative 'database_connection'
require 'time'

class Blah
  attr_reader :id, :blah, :username, :date

  def initialize(id, blah, username, date)
    @id = id
    @blah = blah
    @username = username
    @date = date
  end

  def self.all
    results = DatabaseConnection.query('SELECT * FROM blahs ORDER BY date DESC')
    results.map do |blah|
      Blah.new(
        blah['id'],
        blah['blah'],
        blah['username'],
        Time.parse(blah['date']).strftime("%l:%M %p - %d %b %Y"))
    end
  end

  def self.create(blah, username)
    return false if blah.empty?
    DatabaseConnection.query("INSERT INTO blahs (blah, username)
    VALUES('#{blah}', '#{username}')
    ;")
  end

  def self.delete(blah_id, blah_username)
    DatabaseConnection.query("
      DELETE FROM blahs
      WHERE blahs.id = '#{blah_id}' AND blahs.username = '#{blah_username}'
    ;")
  end
end
