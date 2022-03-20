require 'pg'

class Peep
  attr_reader :peep_content, :id

  def initialize(id:, peep_content:)
    @id = id
    @peep_content = peep_content
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map { |peep| Peep.new(id: peep['id'], peep_content: peep['content']) } 
  end

  def self.create(peep_content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec_params('INSERT INTO peeps (content) VALUES($1) RETURNING id, content;', [peep_content])
    Peep.new(id: result[0]['id'], peep_content: result[0]['content'])
  end
end