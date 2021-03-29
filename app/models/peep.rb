require 'pg'

class Peep
  
  def self.all
    peeps = []
    if ENV['ENVIRONMENT'] == 'test'
			connect = PG.connect :dbname => 'peeps_db_test'
		else
			connect = PG.connect :dbname => 'peeps_db'
		end

    result = connect.exec "SELECT * FROM peeps"
		result.map do |peep|
		peeps << {:id => peep[:id], :message => peep[:message]}
		end
	  peeps
  end
  
  def self.create(message: message)
    if ENV['ENVIRONMENT'] == 'test'
			connect = PG.connect :dbname => 'peeps_db_test'
		else
			connect = PG.connect :dbname => 'peeps_db'
		end

    result = connect.exec "INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;"
    peeps
  end
  
  attr_reader :id, :message
  def initialize(id:, message:)
    @id = id
    @message = message
  end
end