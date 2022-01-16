require 'pg'

class Peep
  attr_reader :content, :id

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.connection
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peep_list_test')
    else    
      connection = PG.connect(dbname: 'peep_list')
    end
  end

  def self.all
    connection

    rows = connection.exec("SELECT * FROM peep_list;")
    
    rows.map do |peep|
      Peep.new(id: peep['id'], content: peep['peep']).content
    end
  end

  def self.add(content:)
       
    rows = connection.exec_params(
      "INSERT INTO peep_list (peep) VALUES($1) RETURNING id, peep", [content]
    )
    Peep.new(id: rows[0]['id'], content: rows[0]['peep'])

  end
end
