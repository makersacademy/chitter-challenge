require 'pg'

class Peep
  attr_reader :id, :title, :peep

  def initialize(id:, title:, peep:)
    @id = id
    @title = title
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peep_manager")
    result.map do |peep|
      Peep.new(id: peep['id'], title: peep['title'], peep: peep['peep'])
    end
  end

  def self.create(title:, peep:)

    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peep_manager (title, peep) VALUES('#{title}', '#{peep}') RETURNING id, title, peep;")
    Peep.new(id: result[0]['id'], title: result[0]['title'], peep: result[0]['peep'])
  end

end