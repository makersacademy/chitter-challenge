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


  def self.add(body)
		if ENV['ENVIRONMENT'] == 'test'
    	connection = PG.connect(dbname: 'chitter_test')
  	else
    	connection = PG.connect(dbname: 'chitter')
  	end
		result = connection.exec("INSERT INTO peeps (body) VALUES('#{body}') RETURNING id, body;")
	  Peep.new(result[0]['id'], result[0]['body'])
	end

end
