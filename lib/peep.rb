require 'pg'

class Peep
attr_reader :id, :peeps
  def initialize(id:, peeps:)
    @id = id
    @peeps = peeps
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
result.map do |peep|
  Peep.new(
    id: peep['id'],
    peeps: peep['peeps']
  )
  end
end

def self.create(params)
  connection = PG.connect(dbname: 'chitter')
  connection.exec("INSERT INTO peeps (peeps) VALUES('#{params['message']}');")
end
end
