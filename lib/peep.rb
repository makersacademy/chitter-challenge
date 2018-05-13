require 'pg'

class Peep

  attr_reader :id, :text

  def initialize(id = id, text = text)
    @id = id
    @text = text
  end

  def ==(other)
    (self.id == other.id)
  end

  def self.create(text)
    result = self.database.exec(
      "INSERT INTO peeps (text)
       VALUES('#{text}') RETURNING id, text"
    )
    Peep.new(result.first['id'], result.first['text'])
  end

  def self.all
    rs = self.database.exec("SELECT * FROM peeps")
    rs.map { |result| Peep.new(result['id'], result['text'])}.reverse
  end

  private

  def self.database
    ENV['RACK'] == 'test' ?
    PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end


end
