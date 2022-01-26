require 'time'
require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :user_id, :time

  def initialize(id:, content:, user_id:, time:)
    @id = id
    @content = content
    @user_id = user_id
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps") #try changing result to peeps = and then peeps.map
    result.map do |peep| 
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        user_id: peep['user_id'],
        time: peep['time']
        ) 
    end 
  end

  def self.sort_all_peeps(peeps = Peep.all)
    chronological_peeps = peeps.sort_by do |peep|
      peep
      Time.parse(peep.time)
    end
      chronological_peeps.reverse
  end

  def self.add(content, user_id = nil )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.now.strftime("%H:%M:%S %d %b %Y")

    result = DatabaseConnection.query(
      "INSERT INTO peeps (content, user_id, time) "\
      "VALUES($1, $2, $3) "\
      "RETURNING id, content, user_id, time;",
      [content, user_id, time]
      )
  
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      user_id: result[0]['user_id'],
      time: result[0]['time']
      )
  end

end