require 'pg'

class Peep
attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(:dbname => 'chitter_test')
    else
      connection = PG.connect(:dbname => 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'])
    end
  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end



end
