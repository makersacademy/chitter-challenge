require 'pg'

class Peep
  attr_reader :id, :body, :time

  def initialize(id, body, time)
    @id = id
    @body = body
    @time = time
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
			connection = PG.connect(dbname: 'chitter')
		end

		result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep|
  	   Peep.new(peep['id'], peep['body'], peep['time'])
    end
  end


  def self.add(body, time = Time.now.strftime('%a, %d %b %Y %H:%M:%S'))
		if ENV['ENVIRONMENT'] == 'test'
    	connection = PG.connect(dbname: 'chitter_test')
  	else
    	connection = PG.connect(dbname: 'chitter')
  	end
		result = connection.exec("INSERT INTO peeps (body, time) VALUES('#{body}', '#{time}') RETURNING id, body, time;")
	  Peep.new(result[0]['id'], result[0]['body'], result[0]['time'])
	end

end
