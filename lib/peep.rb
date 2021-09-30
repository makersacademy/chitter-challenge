require 'pg'

class Peep
  attr_reader :id, :name, :content, :created_at

  def self.all
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], content: peep['content'], created_at: peep['created_at'])
    end
  end

  def self.create(name:, content:)
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    new_peep = connection.exec("INSERT INTO peeps (name, content, created_at) VALUES('#{name}', '#{content}', '#{Time.now}') RETURNING id, name, content, created_at;")
    Peep.new(id: new_peep[0]['id'], name: new_peep[0]['name'], content: new_peep[0]['content'], created_at: new_peep[0]['created_at'])
  end

  def initialize(id:, name:, content:, created_at:)
    @id = id
    @name = name
    @content = content
    @created_at = created_at
  end
end
