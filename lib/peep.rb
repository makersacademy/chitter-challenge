require 'pg'

class Peep

  attr_reader :id, :content, :date

  def initialize(id:, content:, date:)
    @id = id
    @content = content
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")

    result.map { |peep| Peep.new(id: peep['id'], content: peep['content'], date: peep['date']) }
    end


  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (content) VALUES ('#{content}') RETURNING id, content;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['date'])
  end




end
