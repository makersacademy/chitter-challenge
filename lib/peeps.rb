require 'pg'

class Peeps
  attr_reader :id, :text

  def initialize(id: id,text: text)
    @id = id
    @text = text
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'peeps_test')
    else
        connection = PG.connect(dbname: 'peeps')
    end
      result = connection.exec("SELECT * FROM peeps;")
      result.map do |peep|
        Peeps.new(id: peep['id'], text: peep['text'])
      end
  end

  def self.new_peep(text:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'peeps_test')
    else
        connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")
    Peeps.new(id: result[0]['id'], text: result[0]['text'])
  end
end
