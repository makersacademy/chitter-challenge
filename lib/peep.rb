require 'pg'
require 'time'

class Peep
  attr_reader :peep_content, :id, :created_at

  def initialize(id:, peep_content:, created_at:)
    @id = id
    @peep_content = peep_content
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map { |peep| Peep.new(id: peep['id'], peep_content: peep['content'], created_at: peep['created_at']) } 
  end

  def self.create(peep_content:, time: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec_params('INSERT INTO peeps (content, created_at) VALUES($1, $2) RETURNING id, content, created_at;', [peep_content, time])

    Peep.new(id: result[0]['id'], peep_content: result[0]['content'], created_at: result[0]['created_at'])
  end
end