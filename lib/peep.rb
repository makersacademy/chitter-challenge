require 'pg'

class Peep
  attr_reader :id, :body

  def initialize(id, body)
    @id = id
    @body = body
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
			connection = PG.connect(dbname: 'chitter')
		end

		result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep|
  	   Peep.new(peep['id'], peep['body'])
    end
  end

end
