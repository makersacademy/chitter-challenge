require 'pg'

class Peep
  attr_reader :id, :title, :peep

  def initialize(id:, title:, peep:)
    @id = id
    @title = title
    @peep = peep
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peep_manager;")
    result.map { |bookmark| bookmark['peep'] }
  end

  def self.add(peep:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peep_manager (title, peep) VALUES('#{title}','#{peep}')RETURNING peep, title")
end

end
