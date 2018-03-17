require_relative './database_connection'

class Peep

  attr_reader :id, :text, :time, :author

  def initialize(id, text, time=nil, author=nil)
    @id = id
    @text = text
    @time = time
    @author = author
  end

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.all
    sort(peepify(retrieve))
  end

  def self.add(text, author=nil)
    timestring = Time.now.strftime("%Y-%D-%H:%M:%S")
    @con.query("INSERT INTO peeps (text, time, author) "\
    "VALUES ('#{text}', '#{timestring}', '#{author}')")
  end

  def authorstring
    !author ?  'Peeped by anonymous' : "Peeped by #{author}"
  end

  private_class_method

  def self.retrieve
    @con.query('SELECT * FROM peeps')
  end

  def self.peepify(rs)
    rs.map { |peep| Peep.new(peep['id'], peep['text'], peep['time'], peep['author']) }
  end

  def self.sort(peep_array)
    peep_array.sort_by { |peep| peep.time }.reverse
  end
end
