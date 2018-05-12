require 'pg'

class Peep
  attr_reader :text, :author, :time_stamp

  def initialize(text, author, time = Time.now.asctime)
    @text = text
    @author = author
    @time_stamp = time
  end

  def ==(peep)
    @text == peep.text && @author == peep.author
  end

  def self.all
    result = set_database.exec("SELECT * FROM peeps")
    result.map {
       |peep| Peep.new(peep['text'], peep['author'], peep['time_stamp'])
    }.reverse
  end

  def self.create(text, author, time = Time.now.asctime)
    result = set_database.exec(
      "INSERT INTO peeps (text, author, time_stamp)
       VALUES('#{text}', '#{author}', '#{time}') RETURNING text, author"
    )
    Peep.new(result.first['text'], result.first['author'],
    result.first['time_stamp'])
  end

  def self.set_database
    ENV['RACK'] == 'test' ?
    PG.connect(dbname: 'Chitter_test') : PG.connect(dbname: 'Chitter')
  end
end
