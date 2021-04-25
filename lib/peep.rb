require 'pg'

class Peep

  attr_reader :id, :name, :text, :created_at

  def initialize(id:, name:, text:, created_at:)
    @id = id
    @name = name
    @text = text
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| 
      Peep.new(id: peep['id'], name: peep['name'], text: peep['text'], created_at: peep['created_at']) }
  
  end

  def self.create(name:, text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (name, text) VALUES('#{name}', '#{text}') RETURNING id, name, text, created_at;")
    Peep.new(id: result[0]['id'], name: result[0]['name'], text: result[0]['text'], created_at: result[0]['created_at'])
  end

end
