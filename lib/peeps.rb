require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
      
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    time = Time.now.to_s[0..-7]
    connection.exec("INSERT INTO peeps (message, time) 
    VALUES ('#{message}', '#{time}');")
    confirmation = "peep added to database"
  end

end