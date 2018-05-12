require 'pg'

class Peep

  def self.all
    result = set_database.exec("SELECT * FROM peeps")
    result.map { |peep| { text: peep['text'], author: peep['author'] } }
  end

  def self.create(text, author)
    set_database.exec(
      "INSERT INTO peeps (text, author) VALUES('#{text}', '#{author}')"
    )
  end

  def self.set_database
    ENV['RACK'] == 'test' ?
    PG.connect(dbname: 'Chitter_test') : PG.connect(dbname: 'Chitter')
  end
end
