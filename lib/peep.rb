require 'pg'

class Peep
  attr_reader :id, :name, :content

  def self.all
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], content: peep['content'])
    end
  end

  def self.create(name:, content:)
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    new_peep = connection.exec("INSERT INTO peeps (name, content) VALUES('#{name}', '#{content}') RETURNING id, name, content;")
    Peep.new(id: new_peep[0]['id'], name: new_peep[0]['name'], content: new_peep[0]['content'])
  end

  def initialize(id:, name:, content:)
    @id = id
    @name = name
    @content = content
  end
end
