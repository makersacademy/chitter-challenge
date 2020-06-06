require 'pg'

class Peep

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def self.all
    rs = sql_query("SELECT text FROM peeps ORDER BY time DESC")

    rs.map { |peep| Peep.new(peep['text']) }
  end

  def self.create(text)
    sql_query("INSERT INTO peeps (text, time) VALUES ('#{text}', '#{Time.now}')")
  end

  def self.sql_query(string)
    connection.exec(string)
  end

  def self.connection
    return PG.connect :dbname => 'chitter_test' if ENV['RACK_ENV'] == 'test'

    return PG.connect :dbname => 'chitter'
  end

end
