require_relative 'database_connection'

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
    results.map { |blah| Blah.new(blah['id'], blah['blah'], blah['username'], blah['date']) }
  end

  def self.create(blah, username)
    return false if blah.empty?
    DatabaseConnection.query("INSERT INTO blahs (blah, username) VALUES('#{blah}', '#{username}');")
  end
end
