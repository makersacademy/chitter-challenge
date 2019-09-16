require 'pg'

class Message
attr_reader :id, :title, :message, :date

def initialize(id:, title:, message:, date:)
@id = id
@title = title
@message = message
@date = date
end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'peep_manager_test')
    else
    connection = PG.connect(dbname: 'Peep_Manager')
  end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peeps|
      Message.new(id: peeps['id'], title: peeps['title'], message: peeps['peep'], date: peeps['date'])
    end
  end

  def self.create(message:, title:, date:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'peep_manager_test')
    else
    connection = PG.connect(dbname: 'Peep_Manager')
  end
    result = connection.exec("INSERT INTO peeps (peep, title, date) VALUES ('#{message}', '#{title}', '#{date}') RETURNING id, peep, title, date")
     Message.new(id: result[0]['id'], title: result[0]['title'], message: result[0]['message'], date: result[0]['date'])
end
end
