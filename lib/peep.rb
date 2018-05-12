require 'pg'

class Peep
  attr_reader :text, :author

  def initialize(text, author)
    @text = text
    @author = author
  end

  def ==(peep)
    @text == peep.text && @author == peep.author
  end

  def self.all
    result = set_database.exec("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['text'], peep['author']) }.reverse
  end

  def self.create(text, author)
    result = set_database.exec(
      "INSERT INTO peeps (text, author) VALUES('#{text}', '#{author}')
       RETURNING text, author"
    )
    Peep.new(result.first['text'], result.first['author'])
  end

  def self.set_database
    ENV['RACK'] == 'test' ?
    PG.connect(dbname: 'Chitter_test') : PG.connect(dbname: 'Chitter')
  end
end
