require 'pg'
require 'database_connection'

class Peep
  attr_reader :id, :text, :date

  def initialize(id:, text:, date:)
    @id = id
    @text = text
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'],
               text: peep['peep'],
               date: peep['created_at'])
    end
  end

  def self.create(text:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{text}') RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], text: result[0]['peep'], date: result[0]['created_at'])
  end
end
