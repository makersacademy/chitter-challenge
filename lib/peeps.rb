require 'pg'

class Peeps

  attr_reader :id, :name, :peep, :tags

  def initialize(id:, name:, peep:, tags:)
    @id = id
    @name = name
    @peep = peep
    @tags = tags
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(id: peep['id'], name: peep['name'], peep: peep['peep'], tags: peep['tags'])
    end
  end

  def self.create(name:, peep:, tags:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params("INSERT INTO peeps (name, peep, tags) VALUES($1,$2,$3) RETURNING id, name, peep, tags;",[name, peep, tags])
    Peeps.new(id: result[0]['id'],name: result[0]['name'], peep: result[0]['peep'], 
tags: result[0]['tags'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("DELETE FROM peeps WHERE id = $1", [id])
  end

end
