require 'pg'

class Peep
  attr_accessor :id, :message, :date_created

  def initialize(id, message, date_created)
    @id = id
    @message = message
    @date_created = date_created

  end

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec(query)
  end

  def self.all
    result = sql("SELECT * FROM peep;")
    result.map do |sqlresult|
      Peep.new(sqlresult['id'], sqlresult['message'], sqlresult['date_created'])
    end
  end

  def self.add_message(message)
    result = sql("INSERT INTO peep (message) VALUES ('#{message}') RETURNING id, message, date_created;")
    Peep.new(result[0]['id'], result[0]['message'], result[0]['date_created'])
  end
end
