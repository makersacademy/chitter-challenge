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
       VALUES('#{text}') RETURNING text"
    )
    Peep.new(result.first['text'])
  end

  def self.all
    rs = self.database.exec("SELECT * FROM peeps")
    rs.map { |peep| Peep.new(peep['id'], peep['text'])}
  end

  def self.database
    ENV['RACK'] == 'test' ?
    PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end


end
