require 'pg'
require 'date'

class Peep
  attr_reader :id, :title, :peep, :time

  def initialize(id:, title:, peep:, time:)
    @id = id
    @title = title
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peep_manager")
    result.map do |peep|
      Peep.new(id: peep['id'], title: peep['title'], peep: peep['peep'], time:['time'])
    end
  end

  def self.create(title:, peep:)

    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peep_manager (title, peep, time) VALUES('#{title}', '#{peep}', '#{Time.now}') RETURNING id, title, peep, time;")
    Peep.new(id: result[0]['id'], title: result[0]['title'], peep: result[0]['peep'], time: result[0]['time'])
  end

end