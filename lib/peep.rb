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


  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end


  def self.update(id, text)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("UPDATE peeps SET text='#{text}' WHERE id='#{id}' RETURNING id, text;")
    Peep.new(result[0]['id'], result[0]['text'])
  end


  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(result[0]['id'], result[0]['text'])
  end

  




  attr_reader :id, :text

  def initialize(id, text)
    @id = id
    @text = text
  end





end
