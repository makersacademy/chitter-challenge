require 'time'
require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :user, :handle, :time

  def initialize(id:, content:, user:, handle:, time:)
    @id = id
    @content = content
    @user = user
    @handle = handle
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps") #try changing result to peeps = and then peeps.map
    result.map do |peep| 
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        user: peep['username'],
        handle: peep['userhandle'],
        time: peep['time']) 
    end 
  end

  def self.sort_all_peeps(peeps = Peep.all)
    chronological_peeps = peeps.sort_by do |peep|
      peep
      Time.parse(peep.time)
    end
      chronological_peeps.reverse
  end

  def self.add(content: , user: , handle: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.now.strftime("%H:%M:%S %d %b %Y")

    result = DatabaseConnection.query("INSERT INTO peeps (content, username, userhandle, time) VALUES($1, $2, $3, $4) RETURNING id, content, username, userhandle, time;", [content, user, handle, time])
    
    Peep.new(id: result[0]['id'], content: result[0]['content'], user: result[0]['username'], handle: result[0]['userhandle'], time: result[0]['time'])
  end
end