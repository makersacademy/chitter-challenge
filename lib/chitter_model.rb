require 'pg'

class Chitter_Model
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    
    result = connection.exec("SELECT * FROM chitts;")
    result.map {|chitts| p (chitts['username'] + " - " + chitts['chitt']) + " - " + chitts['created_on']} 
  end

  def self.create(username:, chitt:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params(
      "INSERT INTO chitts (username, chitt, created_on) VALUES($1, $2, $3) RETURNING post_id, username, chitt, created_on;", [username, chitt, time]
    )
  end

end