require_relative 'database_connection'

class Blah
  attr_reader :id, :blah, :date

  def initialize(id, blah, date)
    @id = id
    @blah = blah
    @date = date
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM blahs')
    result.map { |blah| Blah.new(blah['id'], blah['blah'], blah['date']) }
  end

  def self.create(blah)
    # why can't i used a symbol in a query?
    DatabaseConnection.query("INSERT INTO blahs (blah) VALUES('#{blah}');")
  end
end
