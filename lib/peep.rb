require 'pg'

class Peep
  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC;")
    result.map do |item|
      Peep.new(id: item["id"], peep: item["peep"], created_at: item["created_at"])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep)
    VALUES('#{peep}') RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  # def self.delete(input)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #   connection.exec("DELETE FROM bookmarks WHERE title = '#{input}';")
  # end

end
