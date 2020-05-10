require 'pg'

class Peep

  attr_reader :id, :message, :name, :time

  def initialize(id:, message:, name:)
    @id = id
    @message = message
    @name = name
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map { |peep| 
    Peep.new(
      id: peep['id'], 
      message: peep['message'], 
      name: peep['name'])
    }
  end

  def self.create(message:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (message, name) VALUES('#{message}', '#{name}') RETURNING id, message, name")
    Peep.new(id: result[0]['id'], message: result[0]['message'], name: result[0]['name'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

end