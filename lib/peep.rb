require 'pg'

class Peep

  attr_reader :id, :text, :date

  def initialize(id:,text:,date:)
    @id=id
    @text=text
    @date=date
  end

  def self.create(text:)

    if ENV['ENVIRONMENT'] == "test"
      connect_to_database = PG.connect(dbname: 'chitter_test')
    else
      connect_to_database= PG.connect(dbname: 'chitter')
    end


      connect_to_database.exec("INSERT INTO peeps (date, text) VALUES(to_char(NOW(), 'HH24:MI:SS'),'#{text}')")

      add_to_database=connect_to_database.exec("SELECT * FROM peeps")

      Peep.new(id: add_to_database[0]['id'], text: add_to_database[0]['text'], date: add_to_database[0]['date'])

    end

    def self.all

      if ENV['ENVIRONMENT'] == "test"
        connect_to_database = PG.connect(dbname: 'chitter_test')
      else
        connect_to_database= PG.connect(dbname: 'chitter')
      end

      list_all = connect_to_database.exec('SELECT * FROM peeps ORDER BY ID DESC')
      list_all.map do |peep|

        Peep.new(id: peep['id'], date: peep['date'], text: peep['text'],date: peep['date'])
    end
  end
end
