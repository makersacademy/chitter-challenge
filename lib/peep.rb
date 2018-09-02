require 'pg'

class Peep


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
       Peep.new(peep["id"], peep["text"])
     end
  end

  def self.create(text)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (text) VALUES ('#{text}') RETURNING id, text;")
    Peep.new(result[0]['id'], result[0]['text'])
  end


  attr_reader :id, :text

  def initialize(id, text)
    @id = id
    @text = text
  end





end
