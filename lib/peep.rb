require 'pg'

class Peep

  attr_reader :id, :text, :time

  def initialize(id = id, text = text, time = Time.now.asctime)
    @id = id
    @text = text
    @time = time
  end

  def ==(other)
    (self.id == other.id)
  end

  def self.create(text, time = Time.now.asctime)
    result = self.database.exec(
      "INSERT INTO peeps (text, time)
       VALUES('#{text}', '#{time}') RETURNING id, text, time"
    )
    Peep.new(result.first['id'], result.first['text'], result.first['time'])
  end

  def self.all
    rs = self.database.exec("SELECT * FROM peeps")
    rs.map { |result| Peep.new(result['id'], result['text'], result['time'])}.reverse
  end

  private

  def self.database
    ENV['RACK'] == 'test' ?
    PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end


end
