require_relative './database_connection'

class Peep

  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.all
    sort(peepify(retrieve))
  end

  def self.add(text)
    @con.query("INSERT INTO peeps (text, time) VALUES ('#{text}', '#{Time.now}')")
  end

  private_class_method

  def self.retrieve
    @con.query('SELECT * FROM peeps')
  end

  def self.peepify(rs)
    rs.map { |peep| Peep.new(peep['id'], peep['text'], peep['time']) }
  end

  def self.sort(peep_array)
    peep_array.sort_by { |peep| peep.time }
  end
end
