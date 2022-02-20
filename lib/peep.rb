require 'pg'

class Peep
  attr_reader :id, :peep_content, :time_posted

  def initialize(id:, peep_content:, time_posted:)
		  @id = id
		  @peep_content = peep_content
		  @time_posted = time_posted
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test') 
    else
      conn = PG.connect(dbname: 'chitter') 
    end
    result = conn.exec("SELECT * FROM peep")
    result.map do |peeps| 
      Peep.new(id: peeps['id'], peep_content: peeps['peep_content'], time_posted: peeps['time_posted'])
    end
  end

  def self.create(peep_content:, time_posted:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test') 
    else
      conn = PG.connect(dbname: 'chitter') 
    end
    result = conn.exec_params(
    "INSERT INTO peep (peep_content, time_posted) VALUES($1, $2) RETURNING id, peep_content, time_posted;", [
      peep_content, time_posted]
      )
    Peep.new(
      id: result[0]['id'], peep_content: result[0]['peep_content'], time_posted: result[0]['time_posted']
      )
  end

end
