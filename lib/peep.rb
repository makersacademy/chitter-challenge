class Peep

  attr_reader :id, :text, :time, :author

  def initialize(id, text, time, author)
    @id = id
    @text = text
    @time = time
    @author = author
  end

  def self.all
    res = DatabaseConnection.query('SELECT * FROM peeps ORDER BY peeps DESC')
    res.map { |peep| Peep.new(peep['id'], peep['text'], peep['time'], peep['author']) }
  end

  def self.all_from(author)
    res = DatabaseConnection.query("SELECT * FROM peeps WHERE author = '#{author}' ORDER BY peeps ASC")
    res.map { |peep| Peep.new(peep['id'], peep['text'], peep['time'], peep['author']) }
  end

  def self.post(text,author,time = Time.new.to_s.rpartition(' ')[0].to_s)
    DatabaseConnection.query("INSERT INTO peeps (text,time,author) VALUES ('#{text}','#{time}','#{author}')")
  end

end
