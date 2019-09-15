require 'pg'

  class Message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'peep_manager_test')
    else
    connection = PG.connect(dbname: 'Peep_Manager')
  end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |message|
      message['peep']
    end
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'peep_manager_test')
    else
    connection = PG.connect(dbname: 'Peep_Manager')
  end
    result = connection.exec("INSERT INTO peeps (peep,date) VALUES ('#{message}') RETURNING id, peep, date;")
end
end
