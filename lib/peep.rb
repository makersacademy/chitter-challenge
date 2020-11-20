require 'pg'

class Peep
  attr_reader :id, :user_id, :content, :time
  def initialize(id, user_id, content, time)
    @id = id
    @user_id = user_id
    @content = content
    @time = time
  end

  def self.create(user_id, content, date, time)
    connection = PG.connect(dbname: 'chitter')
    connection = PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'
    connection.exec("INSERT INTO peeps (user_id, content, date, time) VALUES('#{user_id}', '#{content}', '#{date}', '#{time}');")
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    connection = PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'
    result = connection.exec('SELECT * FROM peeps')
    result.map do |p|
      date_array = p["date"].split("-")
      time_array = p["time"].split(":")
      Peep.new(p["id"], p["user_id"], p["content"],
               Time.new(date_array[0], date_array[1], date_array[2],
                        time_array[0], time_array[1], time_array[2]))
      end
  end

end
