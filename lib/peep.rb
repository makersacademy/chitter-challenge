require 'pg'

class Peep
  attr_reader :content, :id, :time

  def initialize(time: Time.now.to_s[0..-7], id: nil, content: nil)
    @id = id
    @content = content
    @time = time
  end

  def self.connection
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peep_list_test')
    else    
      connection = PG.connect(dbname: 'peep_list')
    end
  end

  def self.add(content:)
       
    rows = connection.exec_params(
      "INSERT INTO peep_list (peep, time) VALUES($1, $2) RETURNING id, peep, time", [content, Time.now]
    )
      Peep.new(id: rows[0]['id'], content: rows[0]['peep'], time: rows[0]['time'])

  end

  def self.all
    connection

    rows = connection.exec("SELECT * FROM peep_list;")
    
    rows.map do |peep|
      "#{Peep.new(id: peep['id'], content: peep['peep'], time: peep['time']).content}: #{Peep.new(id: peep['id'], content: peep['peep'], time: peep['time']).time}"
    end
  end

  
end
