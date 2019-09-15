require 'pg'

class Honk

  attr_reader :id, :text
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'honker_test')
    else
      connection = PG.connect(dbname: 'honker')
    end
    result = connection.exec("SELECT * FROM honks;")
    result.map do |honk| 
      Honk.new(id: honk['id'], text: honk['text'])
    end 
  end

  def self.add(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'honker_test')
    else
      connection = PG.connect(dbname: 'honker')
    end
    result = connection.exec("INSERT INTO honks (text) VALUES ('#{text}') RETURNING id, text;")
    Honk.new(id: result[0]['id'], text: result[0]['text'])
  end

  def initialize(id:, text:)
    @id = id
    @text = text
  end
end
