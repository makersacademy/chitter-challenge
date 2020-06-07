require "pg"

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
   
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message:peep['message'])
    end
  end

  def self.create(message:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message;")
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end
end