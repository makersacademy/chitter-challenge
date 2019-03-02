require 'pg'

class Peep

  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text

  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("INSERT INTO peeps(text) VALUES('#{text}') RETURNING id, text;")
    new(id: result[0]['id'], text: text)
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      new(id: peep['id'], text: peep['text'])
  end
end


end
