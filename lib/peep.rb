require 'pg'
require 'time'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result2 = result.map do |peep|
      Peep.new(content: peep['content'], name: peep['name'], username: peep['username'], id: peep['id'], time: peep['time'])
    end
    result2.sort_by { |peep| -Time.parse(peep.time).to_i }
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("INSERT INTO peeps (name, username, content, time) VALUES ('Jason Wong', 'jasylw', '#{content}', '#{Time.now.getutc}') RETURNING id, username, name, content, time;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], name: result[0]['name'], username: result[0]['username'], time: result[0]['time'])
  end

  def initialize(content:, name:, id:, username:, time:)
    @content = content
    @name = name
    @id = id
    @username = username
    @time = time
  end

  attr_reader :content, :name, :id, :username, :time
end
