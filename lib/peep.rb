require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    peeps = result.map { |peep| peep['content'] }
    time = result.map { |peep| peep['created_at'] }
    together = peeps + time
    together.reverse
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end
end
