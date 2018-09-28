require 'pg'

class Peep

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    connection.exec ("INSERT INTO peeps (messages) VALUES ('#{message}');")
    #message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    rs = connection.exec ('SELECT * FROM peeps')
    rs.map { |peep| peep['messages'] }

    #  Peep.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    #end
    # [
    #   "Testing messages",
    #   "Is working",
    #   "As expected"
    #  ]

  end

end
