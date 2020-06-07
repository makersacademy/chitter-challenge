require 'pg'
require 'date'

class Peep
  attr_reader :id, :title, :peep, :created_at

  def initialize(id:, title:, peep:, created_at:)
    @id = id
    @title = title
    @peep = peep
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peep_manager")
    result.map do |peep|
      Peep.new(id: peep['id'], title: peep['title'], peep: peep['peep'], created_at:['created_at'])
    end
  end

  def self.create(title:, peep:)

    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peep_manager (title, peep, created_at) VALUES('#{title}', '#{peep}', '#{Time.now}') RETURNING id, title, peep, created_at;")
    Peep.new(id: result[0]['id'], title: result[0]['title'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

end