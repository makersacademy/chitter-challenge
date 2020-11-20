require 'pg'

class Peep

  attr_reader :id, :chitter_id, :content, :time

def initialize (id, chitter_id, content, time)
  @id = id
  @chitter_id = chitter_id
  @content = content
  @time = time
end

  def self.create(chitter_id, content, date, time)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (chitter_id, content, date, time) VALUES('#{chitter_id}', '#{content}', '#{date}', '#{time}');")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    results = connection.exec('SELECT * FROM peeps;')
    results.map { |p|
       date_array = p["date"].split("-")
       time_array = p["time"].split(":")
       Peep.new(p["id"], p["chitter_id"], p["content"],
         Time.new(date_array[0], date_array[1], date_array[2],
                  time_array[0], time_array[1], time_array[2]))
                }
  end
end
